//
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';
import 'dart:io';

//      .listen((device) {
//      if(widget.device_id != '')
//        return;
//
//      print('Found device with id ${device.id}!');
//
//
//	setState((){
//		widget.state = "connecting...";
//	});
//
//        flutterReactiveBle.connectToDevice(
//          id: device.id,
//          connectionTimeout: const Duration(seconds: 120),
//        ).listen((connectionState) {
//          // Handle connection state updates
//          print('Connection state: $connectionState');
//
//          if(connectionState.connectionState == DeviceConnectionState.connecting) {
//		print("connecting..");
//          } else if(connectionState.connectionState == DeviceConnectionState.connected) {
//		print("connected!");
//	setState((){
//		widget.state = "connected!";
//	});
//
//		final characteristic = QualifiedCharacteristic(serviceId: Uuid.parse('9A1A0001-B5A3-F393-E0A9-E50E24DCCA9E'), characteristicId: Uuid.parse('9A1A0003-B5A3-F393-E0A9-E50E24DCCA9E'), deviceId: device.id);
//		flutterReactiveBle
//			.subscribeToCharacteristic(characteristic)
//			.cast<Uint8List>()
//			.listen((response) {
//    			        var floats = response.buffer.asFloat64List();
//    			        var ints = response.buffer.asInt64List();
//    			        setState((){
//        			        if     (ints[0] == 0) widget.data.illumination = floats[1];
//        			        else if(ints[0] == 1) widget.data.humidity = floats[1];
//        			        else if(ints[0] == 2) widget.data.temperature = floats[1];
//        			        else if(ints[0] == 3) widget.data.voltage = floats[1];
//        			        else if(ints[0] == 4) widget.data.soilHumidityValue = ints[1];
//    			        });
//			}, onError: (e) {
//    				print(e);
//	setState((){
//		widget.state = "idle";
//	});
//			});
//
//          } else {
//              widget.device_id = '';
//              setState((){
//		widget.state = "idle";
//              });
//          }
//
//        }, onError: (Object error) {
//          // Handle a possible error
//          print('Error: $error');
//              setState((){
//		widget.state = "idle";
//              });
//        });
//
//      }
//    }, onError: (e) {
//      //code for handling error
//      print('eror');
//      print(e);
//              setState((){
//		widget.state = "idle";
//              });
//    });
//
//
//
enum ConnectionState { Idle, Scanning, Connecting, Connected }

class Bluetooth {
  void Function(Map<String, double>)? setState;
  Bluetooth(void Function(Map<String, double>) setState) {
    this.setState = setState;
  }

  final flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? deviceScanStreamSubscription = null;
  DiscoveredDevice? connectedDevice = null;

  var connectionState = ConnectionState.Idle;

  void scan() {
    print('Starting with scanning...');
    deviceScanStreamSubscription =
        flutterReactiveBle.scanForDevices(withServices: [], scanMode: ScanMode.lowPower).listen(onScan);

    connectionState = ConnectionState.Scanning;
  }

  void onScan(DiscoveredDevice device) {
    print('Found device ${device.id} - ${device.name}');
    if (device.name == 'Gaia Plant Sensor') {
      deviceScanStreamSubscription?.cancel();
      connectionState = ConnectionState.Connecting;
      connectedDevice = device;
      connectToDevice();
    }
  }

  void connectToDevice() {
    if (connectedDevice == null) return;
    var device = connectedDevice!;

    flutterReactiveBle
        .connectToDevice(id: device.id, connectionTimeout: const Duration(seconds: 120))
        .listen((connection) {
      print('Connection state: ${connection.connectionState}');
      switch (connection.connectionState) {
        case DeviceConnectionState.connecting:
          connectionState = ConnectionState.Connecting;
          break;

        case DeviceConnectionState.connected:
          connectionState = ConnectionState.Connected;
          registerCharacteristics();
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

  void registerCharacteristics() {
    if (connectedDevice == null) return;
    var device = connectedDevice!;

    for (final characteristic in characteristics.keys) {
      print('Adding listener for characteristic ${characteristic}');

      final qualifiedCharacteristic = QualifiedCharacteristic(
          serviceId: Uuid.parse(characteristic), characteristicId: Uuid.parse(characteristic), deviceId: device.id);

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
