import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/bottom_navigation.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Sensor Information",
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    const Text("Current connection state: xxx"),
                    const SizedBox(height: 10),
                    const Text("Sensor value: xxx"),
                    const SizedBox(height: 35),
                    const Text("Calibrate Sensor",
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    const Text(
                        "Please put in the values from your sensor in order to calibrate the sensor for your plant."),
                    const SizedBox(height: 10),
                    const Text(
                        "Step 1: Stick your sensor in the pot when the soil is dry."),
                    const SizedBox(height: 10),
                    const Text("Step 2: Input the maximum value shown above."),
                    const SizedBox(height: 10),
                    const Text("Step 3: Water your plant generously."),
                    const SizedBox(height: 10),
                    const Text("Step 4: Input the minimum value shown above."),
                    const SizedBox(height: 10),
                    const Text(
                        "Step 5: Save your values and your sensor is calibrated"),
                    const SizedBox(height: 30),
                    TextField(
                        controller: dryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Maximum value")),
                    const SizedBox(height: 20),
                    TextField(
                        controller: wetController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Minimum value")),
                    const SizedBox(height: 15),
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
