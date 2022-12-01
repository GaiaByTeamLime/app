import 'package:firebase_auth/firebase_auth.dart';
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    var waterLevel = 80;
    var sun = 100;

    var message = "Direct sunlight";
    if (sun < 250) message = "Partial sunlight";
    if (sun < 100) message = "Non-direct sunlight";

    return ScrollableHeaderPage(
      "Bobbie",
      <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/edit');
          },
          child:
              BobbieBuilder(waterLevel: waterLevel, pot: 0, face: 0, plant: 0),
        ),
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
                      'State: ${bluetooth.connectionState.toString().split('.').last}')),
              Chip(
                  label: Text(
                      'Logged in user: ${FirebaseAuth.instance.currentUser?.uid}')),
            ],
          ),
        ),
        const SizedBox(height: 56),
        ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('connectedDeviceId', "");
            },
            child: const Text('delete connection')),
        ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setDouble('dry', 0);
              await prefs.setDouble('wet', 0);
            },
            child: const Text('delete calibration')),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text('sign out')),
        ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('reset')),
      ],
    );
  }
}
