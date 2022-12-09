import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/bluetooth.dart';
import '../components/page.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'dart:async';

class CalibratePage extends StatefulWidget {
  const CalibratePage({Key? key}) : super(key: key);

  @override
  State<CalibratePage> createState() => _CalibratePageState();
}

enum CalibratePageStage {
  sensorPositioning,
  initialRead,
  waterYourPlant,
  wateredReading,
  done
}

class _CalibratePageState extends State<CalibratePage> {
  var stage = CalibratePageStage.sensorPositioning;

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    return WillPopScope(
      onWillPop: () async => false,
      child: _getPage(bluetooth),
    );
  }

  Widget _getPage(Bluetooth bluetooth) {
    switch (stage) {
      case CalibratePageStage.sensorPositioning:
        return SensorPositioningCalibratePage(bluetooth, () {
          setState(() {
            stage = CalibratePageStage.initialRead;
          });
        });

      case CalibratePageStage.initialRead:
        return InitialReadCalibratePage(bluetooth, () {
          setState(() {
            stage = CalibratePageStage.waterYourPlant;
          });
        });

      case CalibratePageStage.waterYourPlant:
        return WaterYourPlantCalibratePage(bluetooth, () {
          setState(() {
            stage = CalibratePageStage.wateredReading;
          });
        });

      case CalibratePageStage.wateredReading:
        return WateredReadingCalibratePage(bluetooth, () {
          setState(() {
            stage = CalibratePageStage.done;
          });
        });

      case CalibratePageStage.done:
        return DoneCalibratePage(bluetooth, () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        });
    }
  }
}

class SensorPositioningCalibratePage extends StatelessWidget {
  final void Function() nextStage;
  final Bluetooth bluetooth;
  const SensorPositioningCalibratePage(this.bluetooth, this.nextStage,
      {super.key});

  @override
  Widget build(BuildContext context) {
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
  final Bluetooth bluetooth;
  const InitialReadCalibratePage(this.bluetooth, this.nextStage, {super.key});

  @override
  State<StatefulWidget> createState() => InitialReadCalibratePageState();
}

class InitialReadCalibratePageState extends State<InitialReadCalibratePage> {
  var loading = false;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void timerStart() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        loading = true;
      });

      if (widget.bluetooth.connectionState == BluetoothConnectionState.idle) {
        await widget.bluetooth.connectToStoredDevice();
      }

      var reading = widget.bluetooth
          .getCharacteristic(BluetoothCharacteristic.soilHumidity);

      if (reading != 0) {
        timer.cancel();
        final prefs = await SharedPreferences.getInstance();
        if (kDebugMode) {
          print('Dry value: $reading');
        }
        await prefs.setDouble('dry', reading);

        widget.nextStage();
      }
    });
  }

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
                  child: Image.asset("assets/images/sensor_thing.png",
                      width: 200)),
              const SizedBox(height: 80),
              const Text(
                  'To connect the sensor with your plant, follow these steps',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              const Text('Step 1: Click continue.'),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: loading
                        ? const CircularProgressIndicator()
                        : const Text('')),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: loading ? null : timerStart,
                  child: const Text('Continue'),
                ),
              ),
            ]),
      ),
    ]);
  }
}

class WaterYourPlantCalibratePage extends StatelessWidget {
  final void Function() nextStage;
  final Bluetooth bluetooth;
  const WaterYourPlantCalibratePage(this.bluetooth, this.nextStage,
      {super.key});

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

class WateredReadingCalibratePage extends StatefulWidget {
  final void Function() nextStage;
  final Bluetooth bluetooth;
  const WateredReadingCalibratePage(this.bluetooth, this.nextStage,
      {super.key});

  @override
  State<StatefulWidget> createState() => _WateredReadingCalibratePageState();
}

class _WateredReadingCalibratePageState
    extends State<WateredReadingCalibratePage> {
  var timeLeft = 300;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void timerStart() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (timeLeft == 0) {
        timer.cancel();
        if (widget.bluetooth.connectionState == BluetoothConnectionState.idle) {
          await widget.bluetooth.connectToStoredDevice();
        }

        var reading = widget.bluetooth
            .getCharacteristic(BluetoothCharacteristic.soilHumidity);

        if (reading != 0) {
          timer.cancel();
          final prefs = await SharedPreferences.getInstance();
          if (kDebugMode) {
            print('Wet value: $reading');
          }
          await prefs.setDouble('wet', reading);

          widget.nextStage();
        }
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  String formatTime(int time) =>
      Duration(seconds: time).toString().substring(3, 7);

  @override
  Widget build(BuildContext context) {
    if (timer == null) timerStart();

    return ScrollableHeaderPage("Sensor Setup", <Widget>[
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

class DoneCalibratePage extends StatelessWidget {
  final void Function() nextStage;
  final Bluetooth bluetooth;
  const DoneCalibratePage(this.bluetooth, this.nextStage, {super.key});

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
            const Text('Your sensor is sucessfully set-up!'),
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
