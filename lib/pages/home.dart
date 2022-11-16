import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:io';
import '../bluetooth.dart' as Bluetooth;
import '../components/typography.dart' as Typography;
import '../components/sensor_card.dart';
import '../components/bottom_navigation.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var connected = false;
    var waterLevel = 80;
    var sun = 100;

    var message = "Direct sunlight";
    if (sun < 250) message = "Partial sunlight";
    if (sun < 100) message = "Non-direct sunlight";

    var bobby = Image.asset('assets/images/GreenCaracter.png');
    if (waterLevel < 55)
      bobby = Image.asset('assets/images/OrangeCaracter.png');
    if (waterLevel < 10) bobby = Image.asset('assets/images/RedCaracter.png');

    final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    return Scaffold(
      bottomNavigationBar: BottomNavigation(0),
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: mq.size.height - 110),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: bobby),
                Typography.Title("Bobbie"),
                SizedBox(height: 25),
                Row(
                  children: <Widget>[
                    SizedBox(width: 25),
                    SensorCard(
                        label: '${waterLevel}%',
                        enabled: true,
                        icon: Icons.water_drop,
                        color: Colors.blue),
                    SizedBox(width: 15),
                    SensorCard(
                        label: message,
                        enabled: true,
                        icon: Icons.sunny,
                        color: Colors.yellow),
                    SizedBox(width: 25),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
