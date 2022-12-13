import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaia/controller/user.dart';
import 'package:gaia/pages/connect.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../components/page.dart';
import '../controller/plant.dart';
import 'calibrate.dart';
import 'home.dart';
import 'login.dart';

bool isNullOrEmpty(int? a) => a == 0 || a == null;

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Future<Widget> calulation() async {
    print('a');
    final user = UserController();
    print('b');
    final plant = PlantController();
    print('c');

    // If we're not logged in, go to login page.
    if (FirebaseAuth.instance.currentUser == null) {
      print('d');
      return const LoginPage();
    }

    // If no device is stored, go to the connecting page
    else if (await user.getPlant() == null) {
      print('e');
      return const ConnectBluetoothPage();
    }

    // If no calibration settings are stored, go to the positioning/calibration page
    else if (isNullOrEmpty(await plant.getCalibrationDry())) {
      print('f');
      return const CalibratePage();
    }

    // Otherwise, go home
    else {
      print('g');
      return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: FutureBuilder<Widget>(
        future: calulation(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else if (snapshot.hasError) {
            return ScrollableHeaderPage("Something went wrong", [
              Text('Error: ${snapshot.error}'),
            ]);
          } else {
            return ScrollableHeaderPage("loading user data", const []);
          }
        },
      ),
    );
  }
}
