import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/page.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'dart:async';
import 'dart:math';

class CalibratePage extends StatefulWidget {
  const CalibratePage({Key? key}) : super(key: key);

  @override
  State<CalibratePage> createState() => _CalibratePageState();
}

enum CalibratePageStage {
  SensorPositioning,
  InitialRead,
  WaterYourPlant,
  WateredReading,
  Done
}

class _CalibratePageState extends State<CalibratePage> {
  var stage = CalibratePageStage.SensorPositioning;

  @override
  Widget build(BuildContext context) {
    switch (stage) {
      case CalibratePageStage.SensorPositioning:
        return SensorPositioning_CalibratePage(() {
          setState(() {
            stage = CalibratePageStage.InitialRead;
          });
        });

      case CalibratePageStage.InitialRead:
        return InitialRead_CalibratePage(() {
          setState(() {
            stage = CalibratePageStage.WaterYourPlant;
          });
        });

      case CalibratePageStage.WaterYourPlant:
        return WaterYourPlant_CalibratePage(() {
          setState(() {
            stage = CalibratePageStage.WateredReading;
          });
        });

      case CalibratePageStage.WateredReading:
        return WateredReading_CalibratePage(() {
          setState(() {
            stage = CalibratePageStage.Done;
          });
        });

      case CalibratePageStage.Done:
        return Done_CalibratePage(() {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        });
    }
  }
}

class SensorPositioning_CalibratePage extends StatelessWidget {
  final void Function() nextStage;
  const SensorPositioning_CalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderPage("Sensor Setup", <Widget>[
      const SizedBox(height: 20),
      const Typography.Title("Follow the steps", textAlign: TextAlign.center),
      const SizedBox(height: 30),
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset("assets/images/sensor_setup.png"),
        ),
      ),
      const SizedBox(height: 30),
      const Text(
          'Stick your sensor in the dry soil of your plant. The Gaia logo should be facing towards you.'),
      const SizedBox(height: 10),
      const Text(
          'Make sure to push in the sensor all the way. Until the white part touches the dirt.'),
      const SizedBox(height: 30),
      Center(
        child: ElevatedButton(
          onPressed: nextStage,
          child: const Text("Continue"),
        ),
      ),
    ]);
  }
}

class InitialRead_CalibratePage extends StatelessWidget {
  final void Function() nextStage;
  const InitialRead_CalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderPage("Sensor Setup", <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              Center(
                  child: Image.asset("assets/images/sensor_thing.png",
                      width: 200)),
              const SizedBox(height: 80),
              const Text(
                  'To connect the sensor with your plant, follow these steps',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              const Text('Step 1: Click continue.'),
              const SizedBox(height: 30),
              const Center(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: false ? CircularProgressIndicator() : Text('')),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  child: const Text('Continue'),
                  onPressed: nextStage,
                ),
              ),
            ]),
      ),
    ]);
  }
}

class WaterYourPlant_CalibratePage extends StatelessWidget {
  final void Function() nextStage;
  const WaterYourPlant_CalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderPage("Sensor Setup", <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Center(
              child: Image.asset(
                "assets/images/sensor_thing.png",
                width: 200,
              ),
            ),
            const SizedBox(height: 80),
            const Text(
                'Step 2: Water the plant generously and click continue.'),
            const SizedBox(height: 30),
            const Center(
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: false ? CircularProgressIndicator() : Text('')),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                child: const Text('Continue'),
                onPressed: nextStage,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class WateredReading_CalibratePage extends StatefulWidget {
  final void Function() nextStage;
  const WateredReading_CalibratePage(this.nextStage, {super.key});

  @override
  State<StatefulWidget> createState() => _WateredReading_CalibratePageState();
}

class _WateredReading_CalibratePageState
    extends State<WateredReading_CalibratePage> {
  var timeLeft = 10;
  Timer? timer;

  void timerStart() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        timer.cancel();

        widget.nextStage();
      }

      setState(() {
        timeLeft--;
      });
    });
  }

  String formatTime(int time) =>
      Duration(seconds: time).toString().substring(3, 7);

  @override
  Widget build(BuildContext context) {
    if (timer == null) timerStart();

    return HeaderPage("Sensor Setup", <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100000000),
                  color: const Color(0xFF9ED0B3),
                ),
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    formatTime(timeLeft),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A5251),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
                'The calibration should take 5 minutes to complete, just wait until the timer is done.',
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            const Text('Please keep the app open while the timer is running.',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ]);
  }
}

class Done_CalibratePage extends StatelessWidget {
  final void Function() nextStage;
  const Done_CalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderPage("Sensor Setup", <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            Center(
              child: Image.asset(
                "assets/images/sensor_thing.png",
                width: 200,
              ),
            ),
            const SizedBox(height: 80),
            const Text('Your sensor is sucessfully set-up!'),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                child: const Text('Start using Gaia'),
                onPressed: nextStage,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
