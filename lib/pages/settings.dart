import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/page.dart';
import '../providers/bluetooth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    return ScrollableHeaderPage(
      "Settings",
      <Widget>[
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await bluetooth.connectToStoredDevice();
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: const [
              Expanded(child: Text('connect', textAlign: TextAlign.center)),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('connectedDeviceId', "");
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
            final prefs = await SharedPreferences.getInstance();
            await prefs.setDouble('dry', 0);
            await prefs.setDouble('wet', 0);
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
