// ignore_for_file: avoid_print

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingletonBluetooth {
  SingletonBluetooth._privateConstructor();
  static final SingletonBluetooth _instance =
      SingletonBluetooth._privateConstructor();

  factory SingletonBluetooth() {
    return _instance;
  }
  final flutterReactiveBle = FlutterReactiveBle();
}

enum BluetoothConnectionState { idle, scanning, connecting, connected }

enum BluetoothCharacteristic {
  illumination,
  humidity,
  temperature,
  voltage,
  soilHumidity,
  soilSalt
}

extension BluetoothCharacteristicExtention on BluetoothCharacteristic {
  String get uuid {
    switch (this) {
      case BluetoothCharacteristic.illumination:
        return "9A1A0001-76E2-4C05-AA14-81629336ACB8";
      case BluetoothCharacteristic.humidity:
        return "9A1A0002-76E2-4C05-AA14-81629336ACB8";
      case BluetoothCharacteristic.temperature:
        return "9A1A0003-76E2-4C05-AA14-81629336ACB8";
      case BluetoothCharacteristic.voltage:
        return "9A1A0004-76E2-4C05-AA14-81629336ACB8";
      case BluetoothCharacteristic.soilHumidity:
        return "9A1A0005-76E2-4C05-AA14-81629336ACB8";
      case BluetoothCharacteristic.soilSalt:
        return "9A1A0006-76E2-4C05-AA14-81629336ACB8";
    }
  }
}

class Bluetooth extends ChangeNotifier {
  final flutterReactiveBle = SingletonBluetooth().flutterReactiveBle;
  StreamSubscription<DiscoveredDevice>? _deviceScanStreamSubscription;
  StreamSubscription<ConnectionStateUpdate>?
      _deviceConnectionStreamSubscription;
  String? connectedDeviceId;

  Map<String, String> foundDevices = {};

  // ignore: prefer_final_fields
  Map<BluetoothCharacteristic, double> _characteristics = {
    BluetoothCharacteristic.illumination: 0.0,
    BluetoothCharacteristic.humidity: 0.0,
    BluetoothCharacteristic.temperature: 0.0,
    BluetoothCharacteristic.voltage: 0.0,
    BluetoothCharacteristic.soilHumidity: 0.0,
    BluetoothCharacteristic.soilSalt: 0.0
  };

  double getCharacteristic(BluetoothCharacteristic characteristic) =>
      _characteristics[characteristic]!;

  var connectionState = BluetoothConnectionState.idle;

  @override
  void dispose() {
    disconnect();
    print('dispose!');
    super.dispose();
  }

  void scan() {
    if (connectionState != BluetoothConnectionState.idle) return;
    foundDevices = {};
    _deviceScanStreamSubscription?.cancel();

    _deviceScanStreamSubscription = flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowPower).listen((device) {
      if (device.name != '') {
        foundDevices[device.id] = device.name;
        notifyListeners();
      }
    });

    connectionState = BluetoothConnectionState.scanning;
  }

  void cancelScanning() {
    _deviceScanStreamSubscription?.cancel();
    connectionState = BluetoothConnectionState.idle;
    connectedDeviceId = null;
  }

  void disconnect() {
    _deviceConnectionStreamSubscription?.cancel();
    connectionState = BluetoothConnectionState.idle;
    connectedDeviceId = null;
  }

  void connectToDevice(String deviceId, {void Function()? onSuccess}) {
    print('connect to device $deviceId with state $connectionState');
    if (connectionState != BluetoothConnectionState.scanning) return;

    cancelScanning();
    connectionState = BluetoothConnectionState.connecting;
    connectedDeviceId = deviceId;
    notifyListeners();

    _deviceConnectionStreamSubscription = flutterReactiveBle
        .connectToDevice(
            id: deviceId, connectionTimeout: const Duration(seconds: 120))
        .listen((connection) {
      print('Connection update: $connection');
      switch (connection.connectionState) {
        case DeviceConnectionState.connecting:
          connectionState = BluetoothConnectionState.connecting;
          notifyListeners();
          break;

        case DeviceConnectionState.connected:
          Future.delayed(const Duration(seconds: 2), () {
            print('Connection successful!');
            connectionState = BluetoothConnectionState.connected;
            _registerCharacteristics(deviceId);
            onSuccess?.call();
            notifyListeners();
          });
          break;

        case DeviceConnectionState.disconnecting:
          notifyListeners();
          break;

        case DeviceConnectionState.disconnected:
          connectionState = BluetoothConnectionState.idle;
          connectedDeviceId = null;
          notifyListeners();
          break;
      }
    }, onError: (e) {
      print('Error in listening to device! $e');
    });
  }

  void _registerCharacteristics(String deviceId) {
    for (final characteristic in _characteristics.keys) {
      final qualifiedCharacteristic = QualifiedCharacteristic(
          serviceId: Uuid.parse(characteristic.uuid),
          characteristicId: Uuid.parse(characteristic.uuid),
          deviceId: deviceId);

      flutterReactiveBle
          .subscribeToCharacteristic(qualifiedCharacteristic)
          .cast<Uint8List>()
          .listen(onUpdate(characteristic), onError: (e) {
        print('Error in adding characteristic! $e');
      });
    }
  }

  void Function(Uint8List) onUpdate(BluetoothCharacteristic characteristic) {
    return (response) {
      var value = response.buffer.asFloat64List()[0];
      _characteristics[characteristic] = value;

      notifyListeners();
    };
  }

  Future<void> connectToStoredDevice() async {
    if (connectionState != BluetoothConnectionState.idle) return;

    final prefs = await SharedPreferences.getInstance();
    var connectedDeviceId = prefs.getString('connectedDeviceId') ?? "";
    if (connectedDeviceId == "") return;

    scan();
    connectToDevice(connectedDeviceId);
  }
}
