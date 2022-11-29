import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import '../bluetooth.dart';
import '../components/bobbie_builder.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/sensor_card.dart';
import '../components/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomePageAction {
  HomePageAction();

  Widget build(BuildContext context) {
    return ScrollableHeaderPage('', []);
  }
}

class RedirectAction extends HomePageAction {
  String redirectTo;
  RedirectAction(this.redirectTo);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.pushNamed(context, redirectTo);
    });

    return super.build(context);
  }
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

    return ScrollableHeaderPage(
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
              label:
                  const SizedBox(width: 50, child: Center(child: Text('Edit'))),
            ),
          ),
        ]),
        BobbieBuilder(
            waterLevel: waterLevel, pot: 1, face: 1, plant: 1, color: 1),
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
            children: <Widget>[
              Chip(label: Text('MAC: ${bluetooth.connectedDeviceId}')),
              Chip(
                  label: Text(
                      'State: ${bluetooth.connectionState.toString().replaceAll(RegExp(r"BluetoothConnectionState."), "")}')),
            ],
          ),
        ),
        const SizedBox(height: 56),
        ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setString('connectedDeviceId', "");
            },
            child: const Text('delete conn')),
        ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setDouble('dry', 0);
              prefs.setDouble('wet', 0);
            },
            child: const Text('delete calibration')),
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
                return ScrollableHeaderPage("", []);
              }
            }));
  }
}
