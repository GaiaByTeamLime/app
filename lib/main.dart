import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:typed_data';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class SensorData {
  double illumination = 0;
  double humidity = 0;
  double temperature = 0;
  double voltage = 0;
  int soilHumidityValue = 0;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaia Testing App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  final String title = "Gaia Plant app";
  String device_id = '';
  int current_num = 0;
  SensorData data = SensorData();
  String state = "idle";


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void scan() {
      setState((){
	widget.state = "scanning";
      });
    final flutterReactiveBle = FlutterReactiveBle();

    flutterReactiveBle
      .scanForDevices(withServices: [/*Uuid.parse('9A1A0001-B5A3-F393-E0A9-E50E24DCCA9E')*/], scanMode: ScanMode.lowPower)
      .listen((device) {
      if(widget.device_id != '')
        return;
        
      print('Found device with id ${device.id}!');

      if(device.name == 'UART Service') {
        widget.device_id = device.id;
        print('Found correct device with id ${device.id}!');

	setState((){
		widget.state = "connecting...";
	});

        flutterReactiveBle.connectToDevice(
          id: device.id,
          connectionTimeout: const Duration(seconds: 120),
        ).listen((connectionState) {
          // Handle connection state updates
          print('Connection state: $connectionState');

          if(connectionState.connectionState == DeviceConnectionState.connecting) {
		print("connecting..");
          } else if(connectionState.connectionState == DeviceConnectionState.connected) {
		print("connected!");
	setState((){
		widget.state = "connected!";
	});

		final characteristic = QualifiedCharacteristic(serviceId: Uuid.parse('9A1A0001-B5A3-F393-E0A9-E50E24DCCA9E'), characteristicId: Uuid.parse('9A1A0003-B5A3-F393-E0A9-E50E24DCCA9E'), deviceId: device.id);
		flutterReactiveBle
			.subscribeToCharacteristic(characteristic)
			.cast<Uint8List>()
			.listen((response) {
    			        var floats = response.buffer.asFloat64List();
    			        var ints = response.buffer.asInt64List();
    			        setState((){
        			        if     (ints[0] == 0) widget.data.illumination = floats[1];
        			        else if(ints[0] == 1) widget.data.humidity = floats[1];
        			        else if(ints[0] == 2) widget.data.temperature = floats[1];
        			        else if(ints[0] == 3) widget.data.voltage = floats[1];
        			        else if(ints[0] == 4) widget.data.soilHumidityValue = ints[1];
    			        });
			}, onError: (e) {
    				print(e);
	setState((){
		widget.state = "idle";
	});
			});
		
          } else {
              widget.device_id = '';
              setState((){
		widget.state = "idle";
              });
          }

        }, onError: (Object error) {
          // Handle a possible error
          print('Error: $error');
              setState((){
		widget.state = "idle";
              });
        });

      }
    }, onError: (e) {
      //code for handling error
      print('eror');
      print(e);
              setState((){
		widget.state = "idle";
              });
    });

  }
  
  @override
  Widget build(BuildContext context) {
    var hey = widget.state == "idle" ? scan : null;
      
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Illumination: ${widget.data.illumination}'),
          Slider(
		value: max(0, min(300, widget.data.illumination)),
		max: 300,
		onChanged: (e) {
			setState((){});
		}
          ),
          Text('Humidity: ${widget.data.humidity}'),
          Slider(
		value: max(0, min(100, widget.data.humidity)),
		max: 100,
		onChanged: (e) {
			setState((){});
		}
          ),
          Text('Temperature: ${widget.data.temperature}'),
          Slider(
		value: max(0, min(100, widget.data.temperature)),
		max: 100,
		onChanged: (e) {
			setState((){});
		}
          ),
          Text('Voltage: ${widget.data.voltage}'),
          Slider(
		value: max(3700, min(4200, widget.data.voltage)),
		min: 3700,
		max: 4200,
		onChanged: (e) {
			setState((){});
		}
          ),
          Text('Soil Humidity: ${widget.data.soilHumidityValue}'),
          Slider(
		value: max(0, min(100, widget.data.soilHumidityValue.toDouble())),
		max: 100,
		onChanged: (e) {
			setState((){});
		}
          ),
          SizedBox(height: 40),
          Text('Connection status: ${widget.state}'),
          ElevatedButton(
            onPressed: hey,
            child: const Text('Scan'),
          ),

        ],
      )),
    );
  }
}
