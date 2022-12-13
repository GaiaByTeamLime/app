import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaia/controller/plant.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/bluetooth.dart';
import '../components/page.dart';
import 'package:cloud_functions/cloud_functions.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'dart:async';

class CalibratePage extends StatefulWidget {
  const CalibratePage({Key? key}) : super(key: key);

  @override
  State<CalibratePage> createState() => _CalibratePageState();
}

enum CalibratePageStage { sensorPositioning, initialRead, waterYourPlant, done }

class _CalibratePageState extends State<CalibratePage> {
  var stage = CalibratePageStage.sensorPositioning;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: _getPage(),
    );
  }

  Widget _getPage() {
    switch (stage) {
      case CalibratePageStage.sensorPositioning:
        return SensorPositioningCalibratePage(() {
          setState(() {
            stage = CalibratePageStage.initialRead;
          });
        });

      case CalibratePageStage.initialRead:
        return InitialReadCalibratePage(() {
          setState(() {
            stage = CalibratePageStage.waterYourPlant;
          });
        });

      case CalibratePageStage.waterYourPlant:
        return WaterYourPlantCalibratePage(() {
          setState(() {
            stage = CalibratePageStage.done;
          });
        });

      case CalibratePageStage.done:
        return DoneCalibratePage(() {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.pushNamed(context, "/");
        });
    }
  }
}

class SensorPositioningCalibratePage extends StatelessWidget {
  final void Function() nextStage;
  const SensorPositioningCalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    PlantController().setCalibrationDry(0);
    PlantController().setCalibrationWet(0);
    PlantController().setCalibrating(false);
    FirebaseFunctions.instance.httpsCallable('updateFirestore').call();

    return ScrollableHeaderPage("Sensor Setup", <Widget>[
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

class InitialReadCalibratePage extends StatefulWidget {
  final void Function() nextStage;

  const InitialReadCalibratePage(this.nextStage, {super.key});

  @override
  State<StatefulWidget> createState() => InitialReadCalibratePageState();
}

class InitialReadCalibratePageState extends State<InitialReadCalibratePage> {
  var loading = true;
  Timer? timer;
  DateTime? lastDate;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void timerStart() {
    timer ??= Timer.periodic(const Duration(seconds: 2), (timer) async {
      var reading = await PlantController().getSoilHumidity();
      var updatedOn = await PlantController().getLastUpdated();

      print('old update: $lastDate, new update: $updatedOn, reading: $reading');

      if (updatedOn != lastDate && reading != 0 && updatedOn != null) {
        timer.cancel();
        if (kDebugMode) {
          print('Dry value: $reading');
        }
        await PlantController().setCalibrationDry(reading!.floor());
        await PlantController().setCalibrating(true);

        setState(() {
          loading = false;
        });
      } else {
        // Update firebase values with cloud function
        FirebaseFunctions.instance.httpsCallable('updateFirestore').call();
      }
    });
  }

  Widget page(BuildContext context) {
    timerStart();

    return ScrollableHeaderPage("Sensor Setup", <Widget>[
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
              const Text('Step 1: Press the top button on your sensor'),
              const SizedBox(height: 30),
              if (loading)
                const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.nextStage();
                    },
                    child: const Text('Continue'),
                  ),
                ),
            ]),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DateTime?>(
        future: PlantController().getLastUpdated(),
        builder: (BuildContext context, AsyncSnapshot<DateTime?> snapshot) {
          if (snapshot.hasData) {
            lastDate ??= snapshot.data!;
            return page(context);
          } else if (snapshot.hasError) {
            return ScrollableHeaderPage("something went wrong", [
              Text('error: ${snapshot.error}'),
            ]);
          } else {
            return ScrollableHeaderPage("waiting for last updated", const []);
          }
        });
  }
}

class WaterYourPlantCalibratePage extends StatelessWidget {
  final void Function() nextStage;

  const WaterYourPlantCalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage("Sensor Setup", <Widget>[
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
              child: SizedBox(width: 50, height: 50),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: nextStage,
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class DoneCalibratePage extends StatelessWidget {
  final void Function() nextStage;

  const DoneCalibratePage(this.nextStage, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage("Sensor Setup", <Widget>[
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
            const Text(
                'Calibration will happen in the background, and should finish in around an hour. Your sensor is sucessfully set-up!'),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: nextStage,
                child: const Text('Start using Gaia'),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
