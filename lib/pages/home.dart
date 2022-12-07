import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bluetooth.dart';
import '../providers/user.dart';
import '../components/bobbie_builder.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/sensor_card.dart';
import '../components/page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: (() async {
        User user = Provider.of<User>(context, listen: true);
        await user.update();
        return user;
      })(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InnerHomePage(snapshot.data!);
        } else {
          return ScrollableHeaderPage("Bobbie", const []);
        }
      },
    );
  }
}

class InnerHomePage extends StatelessWidget {
  final User user;
  const InnerHomePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);
    bluetooth.connectToStoredDevice();

    var current =
        bluetooth.getCharacteristic(BluetoothCharacteristic.soilHumidity);
    var waterLevel = 100 - ((current - user.wet) / (user.dry - user.wet) * 100);

    var sunLevel =
        bluetooth.getCharacteristic(BluetoothCharacteristic.illumination);

    var connected =
        bluetooth.connectionState == BluetoothConnectionState.connected &&
            current != 0.0;

    return ScrollableHeaderPage(
      "Bobbie",
      <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/edit');
          },
          child: BobbieBuilder(
            waterLevel: waterLevel.floor(),
            pot: user.pot,
            face: user.face,
            plant: user.plant,
            accessories1: user.accessories1,
            accessories2: user.accessories2,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: <Widget>[
            Expanded(
                child: SensorCard(
                    label: '${waterLevel.floor()}%',
                    enabled: connected,
                    icon: Icons.water_drop,
                    color: Colors.blue)),
            const SizedBox(width: 10),
            Expanded(
                child: SensorCard(
                    label: '${sunLevel.floor()} lx',
                    enabled: connected,
                    icon: Icons.sunny,
                    color: Colors.yellow)),
          ],
        ),
      ],
      menuItems: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings, color: Color(0xFF0A5251)))
      ],
    );
  }
}
