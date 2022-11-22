import 'package:flutter/material.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/sensor_card.dart';
import '../components/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ((context) async {
      final prefs = await SharedPreferences.getInstance();
      var connectedDeviceId = prefs.getString('connectedDeviceId') ?? "";
      var wet = prefs.getInt('wet') ?? 0;
      var dry = prefs.getInt('dry') ?? 0;

      // If no device is stored, go to the connecting page
      if (connectedDeviceId == "") {
        Navigator.pushNamed(context, '/connect');
      }

      // If no calibration settings are stored, go to the positioning/calibration page
      if (wet == 0 || dry == 0) {
        Navigator.pushNamed(context, '/calibrate');
      }

      // Otherwise, connect to the sensor
    })(context);

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
                const Typography.Title("Bobbie"),
                const SizedBox(height: 25),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 25),
                    SensorCard(
                        label: '$waterLevel%',
                        enabled: true,
                        icon: Icons.water_drop,
                        color: Colors.blue),
                    const SizedBox(width: 15),
                    SensorCard(
                        label: message,
                        enabled: true,
                        icon: Icons.sunny,
                        color: Colors.yellow),
                    const SizedBox(width: 25),
                  ],
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('connectedDeviceId', "");
                    },
                    child: const Text('delete conn'))
              ],
            )),
      ),
    );
  }
}
