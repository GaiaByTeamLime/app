import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaia/pages/calibrate.dart';
import 'package:gaia/pages/connect.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bluetooth.dart';
import '../components/page.dart';
import 'home.dart';
import 'login.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Future<Widget> calulation(Bluetooth bluetooth) async {
    final prefs = await SharedPreferences.getInstance();
    var connectedDeviceId = prefs.getString('connectedDeviceId') ?? "";
    var wet = prefs.getDouble('wet') ?? 0;
    var dry = prefs.getDouble('dry') ?? 0;

    // If we're not logged in, go to login page.
    if (FirebaseAuth.instance.currentUser == null) {
      return const LoginPage();
    }

    // If no device is stored, go to the connecting page
    else if (connectedDeviceId == "" || connectedDeviceId == "null") {
      return const ConnectPage();
    }

    // If no calibration settings are stored, go to the positioning/calibration page
    else if (wet == 0 || dry == 0) {
      return const CalibratePage();
    }

    // Otherwise, go home
    else {
      return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    return WillPopScope(
      onWillPop: () async => false,
      child: FutureBuilder<Widget>(
        future: calulation(bluetooth),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return ScrollableHeaderPage("", const []);
          }
        },
      ),
    );
  }
}
