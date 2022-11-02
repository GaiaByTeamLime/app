import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:io';
import 'bluetooth.dart' as Bluetooth;

void main() {
  runApp(const MyApp());
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




  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var characteristics = {
    "9A1A0001-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0002-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0003-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0004-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0005-76E2-4C05-AA14-81629336ACB8": 3239.0,
    "9A1A0006-76E2-4C05-AA14-81629336ACB8": 0.0
  };

  Bluetooth.Bluetooth? bluetooth;
  var selectedIndex = 0;
  var wet = 2600;
  var dry = 3239;
  final wetController = TextEditingController();
  final dryController = TextEditingController();
  


  _MyHomePageState() {
    bluetooth = new Bluetooth.Bluetooth((_characteristics){
      setState((){
        this.characteristics = _characteristics;
      });
    });

    bluetooth?.scan();
    (() async {
      final prefs = await SharedPreferences.getInstance();
      
      wet = prefs.getInt('wet') ?? wet;
      wetController.text = wet.toString();
      
      dry = prefs.getInt('dry') ?? dry;
      dryController.text = dry.toString();
    })();
  }

  @override
  Widget build(BuildContext context) {
    var connected = bluetooth?.connectionState == Bluetooth.ConnectionState.Connected;
    
    var current = characteristics["9A1A0005-76E2-4C05-AA14-81629336ACB8"] ?? dry;
    var waterLevel = 100 - ((current - wet) / (dry - wet) * 100); 

    var sun = characteristics["9A1A0001-76E2-4C05-AA14-81629336ACB8"] ?? 0;
    var message = "Direct sunlight";
    if(sun < 250) message = "Partial sunlight";
    if(sun < 100) message = "Non-direct sunlight";

    var bobby = Image.asset('assets/GreenCaracter.png');
    if(waterLevel < 55) bobby = Image.asset('assets/OrangeCaracter.png'); 
    if(waterLevel < 10) bobby = Image.asset('assets/RedCaracter.png');
    

    final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    var pages = <Widget>[
      ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: mq.size.height - 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: bobby),
            Text("Bobbie", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF5CAF69))),
            SizedBox(height: 25),
            Row(
              children: <Widget>[
                SizedBox(width: 25),
                Expanded(child: Card(child: Container(padding: EdgeInsets.symmetric(vertical: 15), child: Column(
                  children: <Widget>[
                    Icon(Icons.water_drop, color: connected ? Colors.blue : Colors.grey, size: 60.0),
                    SizedBox(height: 10),
                    connected ? Text('${waterLevel.round()}%') : Text(''),
                  ],
                )))),
                SizedBox(width: 15),
                Expanded(child: Card(child: Container(padding: EdgeInsets.symmetric(vertical: 15), child: Column(
                  children: <Widget>[
                    Icon(Icons.sunny, color: connected ? Colors.yellow : Colors.grey, size: 60.0),
                    SizedBox(height: 10),
                    connected ? Text(message) : Text(''),
                  ],
                )))),
                SizedBox(width: 25),
              ],
            )
          ],
        )
      ),
      Padding(padding: EdgeInsets.all(16.0), child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Text("Sensor Information", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text("Current connection state: ${bluetooth?.connectionState}"),
          SizedBox(height: 10),
          Text("Sensor value: ${current}"),
          SizedBox(height: 35),
          Text("Calibrate Sensor", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text("Please put in the values from your sensor in order to calibrate the sensor for your plant."),
          SizedBox(height: 10),
          Text("Step 1: Stick your sensor in the pot when the soil is dry."),
          SizedBox(height: 10),
          Text("Step 2: Input the maximum value shown above."),
          SizedBox(height: 10),
          Text("Step 3: Water your plant generously."),
          SizedBox(height: 10),
          Text("Step 4: Input the minimum value shown above."),
          SizedBox(height: 10),
          Text("Step 5: Save your values and your sensor is calibrated"),
          SizedBox(height: 30),
          TextField(controller: dryController, keyboardType: TextInputType.number, decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Maximum value")),
          SizedBox(height: 20),
          TextField(controller: wetController, keyboardType: TextInputType.number, decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Minimum value")),
          SizedBox(height: 15),
          ElevatedButton(
            //style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));,
            onPressed: () async {
		final prefs = await SharedPreferences.getInstance();
		wet = int.parse(dryController.text);
		dry = int.parse(wetController.text);
		await prefs.setInt('wet', wet);
		await prefs.setInt('dry', dry);
            },
            child: const Text('Save'),
          ),
        ]
      ))
    ];

    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[200],
        onDestinationSelected: (int index) {
          print(index);
          setState((){
		selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      )),



    );





    
  }
}
