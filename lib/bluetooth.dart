import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum BluetoothConnectionState { Idle, Scanning, Connecting, Connected }

class Bluetooth extends ChangeNotifier {
  final flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? _deviceScanStreamSubscription;
  StreamSubscription<ConnectionStateUpdate>?
      _deviceConnectionStreamSubscription;
  String? connectedDeviceId;

  Map<String, String> foundDevices = {};

  Map<String, double> characteristics = {
    "9A1A0001-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0002-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0003-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0004-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0005-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0006-76E2-4C05-AA14-81629336ACB8": 0.0
  };

  var connectionState = BluetoothConnectionState.Idle;

  @override
  void dispose() {
    disconnect();
    print('dispose!');
    super.dispose();
  }

  void scan() {
    print('scan called, $connectionState');
    if (connectionState != BluetoothConnectionState.Idle) return;
    foundDevices = {};
    _deviceScanStreamSubscription?.cancel();

    _deviceScanStreamSubscription = flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowPower).listen((device) {
      if (device.name != '') {
        foundDevices[device.id] = device.name;
        notifyListeners();
      }
    });

    connectionState = BluetoothConnectionState.Scanning;
  }

  void cancelScanning() {
    _deviceScanStreamSubscription?.cancel();
    connectionState = BluetoothConnectionState.Idle;
    connectedDeviceId = null;
  }

  void disconnect() {
    _deviceConnectionStreamSubscription?.cancel();
    connectionState = BluetoothConnectionState.Idle;
    connectedDeviceId = null;
  }

  void connectToDevice(String deviceId, {void Function()? onSuccess}) {
    if (connectionState != BluetoothConnectionState.Scanning) return;

    cancelScanning();
    connectionState = BluetoothConnectionState.Connecting;
    connectedDeviceId = deviceId;
    notifyListeners();

    _deviceConnectionStreamSubscription = flutterReactiveBle
        .connectToDevice(
            id: deviceId, connectionTimeout: const Duration(seconds: 120))
        .listen((connection) {
      switch (connection.connectionState) {
        case DeviceConnectionState.connecting:
          connectionState = BluetoothConnectionState.Connecting;
          notifyListeners();
          break;

        case DeviceConnectionState.connected:
          Future.delayed(const Duration(seconds: 2), () {
            connectionState = BluetoothConnectionState.Connected;
            _registerCharacteristics(deviceId);
            onSuccess?.call();
            notifyListeners();
          });
          break;

        case DeviceConnectionState.disconnecting:
          notifyListeners();
          break;

        case DeviceConnectionState.disconnected:
          connectionState = BluetoothConnectionState.Idle;
          connectedDeviceId = null;
          notifyListeners();
          break;
      }
    });
  }

  void _registerCharacteristics(String deviceId) {
    for (final characteristic in characteristics.keys) {
      final qualifiedCharacteristic = QualifiedCharacteristic(
          serviceId: Uuid.parse(characteristic),
          characteristicId: Uuid.parse(characteristic),
          deviceId: deviceId);

      flutterReactiveBle
          .subscribeToCharacteristic(qualifiedCharacteristic)
          .cast<Uint8List>()
          .listen(onUpdate(characteristic));
    }
  }

  void Function(Uint8List) onUpdate(String uuid) {
    return (response) {
      var value = response.buffer.asFloat64List()[0];
      characteristics[uuid] = value;

      notifyListeners();
    };
  }
}
