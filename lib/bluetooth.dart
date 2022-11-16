import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:typed_data';
import 'dart:async';

// ignore: constant_identifier_names
enum BluetoothConnectionState { Idle, Scanning, Connecting, Connected }

class Bluetooth {
  void Function(Map<String, double>)? setState;
  Bluetooth(this.setState);

  final flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? deviceScanStreamSubscription;
  String? connectedDeviceId;

  var connectionState = BluetoothConnectionState.Idle;

  void scan(void Function(String, String) callback) {
    if (connectionState != BluetoothConnectionState.Idle) return;

    print('Starting with scanning...');
    deviceScanStreamSubscription = flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowPower).listen((device) {
      if (device.name != '') {
        callback(device.id, device.name);
      }
    });

    connectionState = BluetoothConnectionState.Scanning;
  }

  void cancelScanning() {
    deviceScanStreamSubscription?.cancel();
    connectionState = BluetoothConnectionState.Idle;
    connectedDeviceId = null;
  }

  void connectToDevice(String deviceId) {
    if (connectionState != BluetoothConnectionState.Scanning) return;

    cancelScanning();
    connectionState = BluetoothConnectionState.Connecting;
    connectedDeviceId = deviceId;

    flutterReactiveBle
        .connectToDevice(
            id: deviceId, connectionTimeout: const Duration(seconds: 120))
        .listen((connection) {
      print('Connection state: ${connection.connectionState}');
      switch (connection.connectionState) {
        case DeviceConnectionState.connecting:
          connectionState = BluetoothConnectionState.Connecting;
          break;

        case DeviceConnectionState.connected:
          connectionState = BluetoothConnectionState.Connected;
          registerCharacteristics(deviceId);
          break;

        case DeviceConnectionState.disconnecting:
          break;

        case DeviceConnectionState.disconnected:
          connectionState = BluetoothConnectionState.Idle;
          connectedDeviceId = null;
          break;
      }
    });
  }

  var characteristics = {
    "9A1A0001-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0002-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0003-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0004-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0005-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0006-76E2-4C05-AA14-81629336ACB8": 0.0
  };

  void registerCharacteristics(String deviceId) {
    for (final characteristic in characteristics.keys) {
      print('Adding listener for characteristic $characteristic');

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
      setState?.call(characteristics);
    };
  }
}
