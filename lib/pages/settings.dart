import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaia/controller/plant.dart';
import 'package:gaia/controller/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/page.dart';
import '../providers/bluetooth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage(
      "Settings",
      <Widget>[
        const SizedBox(height: 20),
        const Text('Avatar'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(context, '/edit');
          },
          child: Row(
            children: const [
              Expanded(child: Text('Customize', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(context, '/edit_name');
          },
          child: Row(
            children: const [
              Expanded(child: Text('Change name', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text('Sensor'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await PlantController().setCalibrationWet(0);
            await PlantController().setCalibrationDry(0);
            await PlantController().setCalibrating(false);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(
                  child:
                      Text('Reset calibration', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await PlantController().setCalibrationWet(0);
            await PlantController().setCalibrationDry(0);
            await PlantController().setCalibrating(false);
            await UserController().setPlant(null);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(child: Text('Disconnect', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text('Account'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(child: Text('Sign Out', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
      backButton: () {
        Navigator.pop(context);
      },
    );
  }
}
