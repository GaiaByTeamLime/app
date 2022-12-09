// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:blufi_plugin/blufi_plugin.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BlufiConnectionState {
  idle,
  scanningBluetooth,
  connectingBluetooth,
  connectedBluetooth,
  scanningWifi,
  connectingWifi,
  connected,
}

class Blufi extends ChangeNotifier {
  Blufi._privateConstructor();
  static final Blufi _instance = Blufi._privateConstructor();
  factory Blufi() => _instance;

  String? connectedDeviceId;
  String? connectedSsid;
  void Function()? _onWifiError;
  int _ignoredPacketCount = 0;

  Map<String, String> foundDevices = {};
  Map<String, String> foundNetworks = {};

  Timer? _wifiScanTimer;
  Timer? _wifiConnectTimeout;

  var connectionState = BlufiConnectionState.idle;

  @override
  void dispose() {
    stopWifiScanning();
    disconnect();
    cancelScanning();
    notifyListeners();
    super.dispose();
  }

  Future<void> scan() async {
    if (connectionState != BlufiConnectionState.idle) return;
    print("scan called!");
    connectionState = BlufiConnectionState.scanningBluetooth;
    foundDevices = {};

    BlufiPlugin.instance.onMessageReceived(
      successCallback: (String? data) {
        Map<String, dynamic> mapData = json.decode(data ?? "{}");
        if (mapData.containsKey('key')) {
          String key = mapData['key'];
          if (key == 'ble_scan_result') {
            Map<String, dynamic> peripheral = mapData['value'];

            String address = peripheral['address'];
            String name = peripheral['name'];
            foundDevices[address] = name;
            notifyListeners();
          }
        }
      },
      errorCallback: (String? error) {
        print(
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! errorCallback $error");
      },
    );

    try {
      print('scan device info');
      await BlufiPlugin.instance.scanDeviceInfo();
    } on PlatformException catch (e) {
      print("Scanning failed: $e");
      await BlufiPlugin.instance.stopScan();
    }
  }

  void cancelScanning() async {
    if (connectionState != BlufiConnectionState.scanningBluetooth) return;

    await BlufiPlugin.instance.stopScan();
    connectionState = BlufiConnectionState.idle;
    connectedDeviceId = null;
  }

  void connectToDevice(String deviceId,
      {void Function()? onSuccess, void Function(Object?)? onError}) async {
    if (connectionState != BlufiConnectionState.scanningBluetooth) return;
    print('connect to device $deviceId with state $connectionState');

    cancelScanning();
    connectionState = BlufiConnectionState.connectingBluetooth;
    connectedDeviceId = deviceId;
    notifyListeners();

    try {
      await BlufiPlugin.instance
          .connectPeripheral(peripheralAddress: deviceId)
          .then((_) {
        print("Connect to $deviceId");

        // We add a 2s delay here to make the connection feel more "real".
        Future.delayed(const Duration(seconds: 2), () {
          print('Connection successful!');
          connectionState = BlufiConnectionState.connectedBluetooth;
          onSuccess?.call();
          notifyListeners();
        });
      }).catchError((e) {
        print('Connection failed! $e');
        connectionState = BlufiConnectionState.idle;
        connectedDeviceId = null;
        scan();
        notifyListeners();
      });
    } on PlatformException catch (e) {
      print('Something went wrong: $e');
      onError?.call(e);
    }
  }

  Future<void> disconnect() async {
    if (connectionState != BlufiConnectionState.connectedBluetooth) return;
    connectionState = BlufiConnectionState.idle;
    await BlufiPlugin.instance.requestCloseConnection();
  }

  void scanForWifiNetworks({required void Function()? onError}) {
    print("Scan for wifi networks called.");
    if (connectionState != BlufiConnectionState.connectedBluetooth) return;

    connectionState = BlufiConnectionState.scanningWifi;
    foundDevices = {};
    _onWifiError = onError;
    _ignoredPacketCount = 0;

    void handleError() {
      print('error! Reset sensor now!');
      stopWifiScanning();
      disconnect();
      notifyListeners();
      _onWifiError?.call();
    }

    print("Replace on message recieved callback");
    BlufiPlugin.instance.onMessageReceived(
      successCallback: (String? data) {
        Map<String, dynamic> mapData = json.decode(data ?? "{}");
        if (mapData.containsKey('key')) {
          String key = mapData['key'];
          if (key == 'wifi_info') {
            if (mapData['value'] == "0") {
              print("Value was 0 ignore packet $_ignoredPacketCount");
              _ignoredPacketCount++;

              if (_ignoredPacketCount > 3) {
                handleError();
              }
              return;
            }
            // If we succeed, reset the counter.
            _ignoredPacketCount = 0;

            Map<String, dynamic> peripheral = mapData['value'];

            String ssid = peripheral['ssid'];
            String rssi = peripheral['rssi'];

            foundNetworks[ssid] = rssi;
            notifyListeners();
          } else if (key == 'receive_error_code') {
            handleError();
          }
        }
      },
      errorCallback: (String? error) {
        print(
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! errorCallback $error");
        handleError();
      },
    );

    _wifiScanTimer ??= Timer.periodic(const Duration(seconds: 10), (timer) {
      print("requestDeviceScan");
      BlufiPlugin.instance.requestDeviceScan();
    });
  }

  void stopWifiScanning() {
    if (connectionState != BlufiConnectionState.scanningWifi) return;
    print("Stopping timer...");
    _wifiScanTimer?.cancel();
    _wifiScanTimer = null;
    _wifiConnectTimeout?.cancel();
    _wifiConnectTimeout = null;
    connectionState = BlufiConnectionState.connectedBluetooth;
  }

  void connectToWifiNetwork(
    String ssid,
    String password, {
    required Future<void> Function() onSuccess,
    required Future<void> Function(Object?) onError,
    required Future<void> Function() onTimeout,
  }) async {
    if (connectionState != BlufiConnectionState.scanningWifi) return;
    stopWifiScanning();
    print("Connecting to $ssid with password $password");
    connectionState = BlufiConnectionState.connectingWifi;
    connectedSsid = ssid;
    notifyListeners();

    void handleError(Object? error) {
      print("idk? $error");
      connectionState = BlufiConnectionState.connectedBluetooth;
      connectedSsid = null;
      _wifiConnectTimeout?.cancel();
      _wifiConnectTimeout = null;

      scanForWifiNetworks(onError: _onWifiError!);
      // the _onWifiError is still there from the previous scan attempt

      onError(error);
      notifyListeners();
    }

    BlufiPlugin.instance.onMessageReceived(
      successCallback: (String? data) {
        Map<String, dynamic> mapData = json.decode(data ?? "{}");
        if (mapData.containsKey('key')) {
          String key = mapData['key'];
          var value = mapData['value'];
          if (key == 'device_wifi_connect') {
            if (value == "1") {
              _wifiConnectTimeout?.cancel();
              _wifiConnectTimeout = null;
              print("Wifi connection was super duper successful!");
              Future.delayed(const Duration(seconds: 2), () {
                print("Connection success! $value");
                connectionState = BlufiConnectionState.connected;
                onSuccess();
                notifyListeners();
              });
            } else {
              handleError("`device_wifi_connect` failed with code $value");
            }
          } else if (key == 'receive_error_code') {
            handleError(
                "Recieved `receive_error_code` from device with value $value");
          }
        }
      },
      errorCallback: (String? error) {
        print(
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! errorCallback $error");
        handleError(error);
      },
    );

    print('Starting timeout timer');
    _wifiConnectTimeout ??= Timer(const Duration(seconds: 15), () {
      _wifiConnectTimeout = null;
      print('timeout');
      connectionState = BlufiConnectionState.connectedBluetooth;
      connectedSsid = null;
      scanForWifiNetworks(onError: _onWifiError!);
      notifyListeners();
      onTimeout();
    });

    await BlufiPlugin.instance
        .configProvision(username: ssid, password: password);
  }
}
