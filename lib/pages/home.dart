import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import '../bluetooth.dart';
import '../components/typography.dart' as Typography;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/sensor_card.dart';
import '../components/bottom_navigation.dart';
import '../components/page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomePageAction {
  HomePageAction() {}

  Widget build(BuildContext context) {
    return const Text('');
  }
}

class RedirectAction extends HomePageAction {
  String redirectTo;
  RedirectAction(this.redirectTo);
}

class DataAction extends HomePageAction {
  Bluetooth bluetooth;
  DataAction(this.bluetooth);

  Future<void> init() async {
    await bluetooth.connectToStoredDevice();
  }

  @override
  Widget build(BuildContext context) {
    var waterLevel = 80;
    var sun = 100;

    var message = "Direct sunlight";
    if (sun < 250) message = "Partial sunlight";
    if (sun < 100) message = "Non-direct sunlight";

    var bobby = Image.asset('assets/images/GreenCaracter.png');
    if (waterLevel < 55) {
      bobby = Image.asset('assets/images/OrangeCaracter.png');
    }
    if (waterLevel < 10) {
      bobby = Image.asset('assets/images/RedCaracter.png');
    }

    return HeaderPage(
      "Bobbie",
      <Widget>[
        Row(children: <Widget>[
          const Expanded(child: SizedBox()),
          Container(
            transform: Matrix4.translationValues(20.0, 0.0, 0.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.onPrimary,
                onPrimary: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/edit');
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit'),
            ),
          ),
        ]),
        SizedBox(height: 332, child: Center(child: bobby)),
        Text('${bluetooth.connectedDeviceId}: ${bluetooth.connectionState}'),
        const SizedBox(height: 25),
        Row(
          children: <Widget>[
            Expanded(
                child: SensorCard(
                    label: '$waterLevel%',
                    enabled: true,
                    icon: Icons.water_drop,
                    color: Colors.blue)),
            const SizedBox(width: 10),
            Expanded(
                child: SensorCard(
                    label: message,
                    enabled: true,
                    icon: Icons.sunny,
                    color: Colors.yellow)),
          ],
        ),
        const SizedBox(height: 56),
        const Typography.Title("Nutrition Levels", textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Chip(label: Text('Placement: No direct sunlight')),
              Chip(label: Text('Watering: Every 4 days')),
              Chip(label: Text('Scientific Name: Spider Plant')),
              Chip(label: Text('Difficulty: Easy')),
            ],
          ),
        ),
        const SizedBox(height: 56),
      ],
    );
  }
}

class SensorDataAction extends HomePageAction {}

class _HomePageState extends State<HomePage> {
  Future<HomePageAction> calulation(Bluetooth bluetooth) async {
    final prefs = await SharedPreferences.getInstance();
    var connectedDeviceId = prefs.getString('connectedDeviceId') ?? "";
    var wet = prefs.getDouble('wet') ?? 0;
    var dry = prefs.getDouble('dry') ?? 0;

    // If no device is stored, go to the connecting page
    if (connectedDeviceId == "") {
      return RedirectAction('/connect');
    }

    // If no calibration settings are stored, go to the positioning/calibration page
    else if (wet == 0 || dry == 0) {
      return RedirectAction('/calibrate');
    }

    // Otherwise, connect to the sensor

    var page = DataAction(bluetooth);
    await page.init();
    return page;
  }

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    return WillPopScope(
        onWillPop: () async => false,
        child: FutureBuilder<HomePageAction>(
            future: calulation(bluetooth),
            builder:
                (BuildContext context, AsyncSnapshot<HomePageAction> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.build(context);
              } else {
                return const Text('Loading!');
              }
            }));
  }
}
