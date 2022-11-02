import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:io';
import 'bluetooth.dart';

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
    "9A1A0005-76E2-4C05-AA14-81629336ACB8": 0.0,
    "9A1A0006-76E2-4C05-AA14-81629336ACB8": 0.0
  };

  Bluetooth? bluetooth;

  _MyHomePageState() {
    bluetooth = new Bluetooth((_characteristics){
      print('water: ${_characteristics["9A1A0005-76E2-4C05-AA14-81629336ACB8"]}, light: ${_characteristics["9A1A0001-76E2-4C05-AA14-81629336ACB8"]}');
      setState((){
        this.characteristics = _characteristics;
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    const wet = 2600;
    const dry = 3239;
    var current = characteristics["9A1A0005-76E2-4C05-AA14-81629336ACB8"] ?? dry;
    var waterLevel = 100 - ((current - wet) / (dry - wet) * 100); 

    var sun = characteristics["9A1A0001-76E2-4C05-AA14-81629336ACB8"] ?? 0;
    var message = "Direct sunlight";
    if(sun < 250) message = "Partial sunlight";
    if(sun < 100) message = "Non-direct sunlight";

    var bobby = Image.asset('assets/GreenCaracter.png');
    if(waterLevel < 55) bobby = Image.asset('assets/OrangeCaracter.png'); 
    if(waterLevel < 10) bobby = Image.asset('assets/RedCaracter.png'); 

    
    return SafeArea(child: Scaffold(
      body: Column(
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
                  Icon(Icons.water_drop, color: Colors.blue, size: 60.0),
                  SizedBox(height: 10),
                  Text('${waterLevel.round()}%'),
                ],
              )))),
              SizedBox(width: 15),
              Expanded(child: Card(child: Container(padding: EdgeInsets.symmetric(vertical: 15), child: Column(
                children: <Widget>[
                  Icon(Icons.sunny, color: Colors.yellow, size: 60.0),
                  SizedBox(height: 10),
                  Text(message),
                ],
              )))),
              SizedBox(width: 25),
            ],
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[200],
        onDestinationSelected: (int index) {
          bluetooth?.scan();
        },
        selectedIndex: 0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.stop),
            label: 'FAQ',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.change_history),
            label: 'Social',
          ),
        ],
      )),



    );





    
  }
}
