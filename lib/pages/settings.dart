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
        ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(context, '/edit');
          },
          child: Row(
            children: const [
              Expanded(child: Text('edit avatar', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            UserController().setPlant(null);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(
                  child: Text('delete stored connection',
                      textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            PlantController().setCalibrationWet(0);
            PlantController().setCalibrationDry(0);
            PlantController().setCalibrating(false);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(
                  child:
                      Text('delete calibration', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            PlantController().setCalibrationWet(0);
            PlantController().setCalibrationDry(0);
            PlantController().setCalibrating(false);
            UserController().setPlant(null);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(child: Text('delete both', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(child: Text('sign out', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            PlantController().setCalibrationWet(0);
            PlantController().setCalibrationDry(0);
            PlantController().setCalibrating(false);
            UserController().setPlant(null);
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(
                  child: Text('reset everything', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(child: Text('reload app', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
      ],
      backButton: () {
        Navigator.pushNamed(context, '/');
      },
    );
  }
}
