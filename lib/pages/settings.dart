import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:io';
import '../bluetooth.dart' as Bluetooth;
import '../components/typography.dart' as Typography;
import '../components/bottom_navigation.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var wet = 2600;
  var dry = 3239;
  final wetController = TextEditingController();
  final dryController = TextEditingController();

  _SettingsPageState() {
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
    return Scaffold(
      bottomNavigationBar: BottomNavigation(1),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Sensor Information", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Text("Current connection state: xxx"),
                    SizedBox(height: 10),
                    Text("Sensor value: xxx"),
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
                    TextField(
                        controller: dryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Maximum value")),
                    SizedBox(height: 20),
                    TextField(
                        controller: wetController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Minimum value")),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        wet = int.parse(dryController.text);
                        dry = int.parse(wetController.text);
                        await prefs.setInt('wet', wet);
                        await prefs.setInt('dry', dry);
                      },
                      child: const Text('Save'),
                    ),
                  ]))),
    );
  }
}
