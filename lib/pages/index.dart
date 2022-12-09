import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaia/pages/connect.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../components/page.dart';
import '../providers/blufi.dart';
import 'home.dart';
import 'login.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Future<Widget> calulation(Blufi blufi) async {
    // final prefs = await SharedPreferences.getInstance();
    // var connectedDeviceId = prefs.getString('connectedDeviceId') ?? "";
    // var wet = prefs.getDouble('wet') ?? 0;
    // var dry = prefs.getDouble('dry') ?? 0;

    // If we're not logged in, go to login page.
    if (FirebaseAuth.instance.currentUser == null) {
      return const LoginPage();
    }

    // If no device is stored, go to the connecting page
    else if (blufi.connectionState == BlufiConnectionState.idle ||
        blufi.connectionState == BlufiConnectionState.scanningBluetooth ||
        blufi.connectionState == BlufiConnectionState.connectingBluetooth) {
      return const ConnectBluetoothPage();
    }

    // If no device is stored, go to the connecting page
    else if (blufi.connectionState == BlufiConnectionState.connectedBluetooth ||
        blufi.connectionState == BlufiConnectionState.scanningWifi) {
      return const ConnectWifiPage();
    }

    // If no calibration settings are stored, go to the positioning/calibration page
    // else if (wet == 0 || dry == 0) {
    //   return const CalibratePage();
    // }

    // Otherwise, go home
    else {
      return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    Blufi blufi = Provider.of<Blufi>(context, listen: false);

    return WillPopScope(
      onWillPop: () async => false,
      child: FutureBuilder<Widget>(
        future: calulation(blufi),
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
