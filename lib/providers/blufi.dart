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
      await BlufiPlugin.instance.scanDeviceInfo(filterString: 'BLUFI_DEVICE');
    } on PlatformException catch (e) {
      print("Scanning failed: $e");
      await BlufiPlugin.instance.stopScan();
    } catch (e) {
      print("Caught exeption $e!");
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

    void handleError() {
      print('Connection failed!');
      connectionState = BlufiConnectionState.idle;
      connectedDeviceId = null;
      scan();
      notifyListeners();
    }

    print("Replace on message recieved callback");
    BlufiPlugin.instance.onMessageReceived(
      successCallback: (String? data) {
        Map<String, dynamic> mapData = json.decode(data ?? "{}");
        if (mapData.containsKey('key')) {
          String key = mapData['key'];
          if (key == 'peripheral_connect') {
            if (mapData['value'] == "0") {
              handleError();
              return;
            }

            print('Connection successful!');
            connectionState = BlufiConnectionState.connectedBluetooth;
            onSuccess?.call();
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

    try {
      await BlufiPlugin.instance.connectPeripheral(peripheralAddress: deviceId);
    } on PlatformException catch (e) {
      print('Something went wrong: $e');
      onError?.call(e);
    }
  }

  Future<void> disconnect() async {
    if (connectionState != BlufiConnectionState.connectedBluetooth ||
        connectionState != BlufiConnectionState.scanningWifi ||
        connectionState != BlufiConnectionState.scanningWifi ||
        connectionState != BlufiConnectionState.connected) return;
    connectionState = BlufiConnectionState.idle;
    await BlufiPlugin.instance.requestCloseConnection();
  }

  void scanForWifiNetworks({required void Function()? onError}) {
    print("Scan for wifi networks called.");
    if (connectionState != BlufiConnectionState.connectedBluetooth) return;

    connectionState = BlufiConnectionState.scanningWifi;
    foundDevices = {};
    _onWifiError = onError;

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
              handleError();
              return;
            }

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
    _wifiConnectTimeout ??= Timer(const Duration(seconds: 60), () {
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

  void registerAuthToken(
    String token,
    String uid, {
    required Future<void> Function() onSuccess,
    required Future<void> Function(Object?) onError,
  }) async {
    if (connectionState != BlufiConnectionState.connected) return;

    BlufiPlugin.instance.onMessageReceived(
      successCallback: (String? data) {
        Map<String, dynamic> mapData = json.decode(data ?? "{}");
        if (mapData.containsKey('key')) {
          String key = mapData['key'];
          var value = mapData['value'];
          if (key == 'post_custom_data') {
            if (value == "1") {
              print("Set token successfully!");
              onSuccess();
            } else {
              onError("`device_token_set` failed with code $value");
            }
          } else if (key == 'receive_error_cWode') {
            onError(
                "Recieved `receive_error_code` from device with value $value");
          }
        }
      },
      errorCallback: (String? error) {
        print(
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! errorCallback $error");
        onError(error);
      },
    );

    BlufiPlugin.instance.postCustomData(token + uid);
  }
}
