import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaia/controller/plant.dart';
import 'package:gaia/controller/user.dart';

import '../components/page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Future<bool?> _confirm(
          BuildContext context, String action, String description) =>
      showDialog<bool?>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(action),
              content: Text(description),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: TextButton.styleFrom(primary: Colors.redAccent),
                  child: const Text('Confirm'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('Cancel')),
              ],
            );
          });

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
            var confirmed = await _confirm(context, "Delete calibration",
                'This action cannot be undone. You will have to redo calibration before you can use Gaia again.');
            if (confirmed != true) return;

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
                      Text('Delete calibration', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            var confirmed = await _confirm(context, "Delete connection",
                'This action cannot be undone. You will have to factory reset your sensor after this.');
            if (confirmed != true) return;

            await PlantController().setCalibrationWet(0);
            await PlantController().setCalibrationDry(0);
            await PlantController().setCalibrating(false);
            await UserController().setPlant(null);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(
                  child:
                      Text('Delete connection', textAlign: TextAlign.center)),
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
