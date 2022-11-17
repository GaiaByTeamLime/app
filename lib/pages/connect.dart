// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bluetooth.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import '../components/page.dart';
import '../components/device_card.dart';
import 'package:provider/provider.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    // When the page is rendered, start scanning if we aren't already scanning
    bluetooth.scan();

    var devices = bluetooth.foundDevices.entries.map((device) => DeviceCard(
        name: device.value,
        mac: device.key,
        isConnecting: bluetooth.connectedDeviceId == device.key &&
            bluetooth.connectionState == BluetoothConnectionState.Connecting,
        isConnected: bluetooth.connectedDeviceId == device.key &&
            bluetooth.connectionState == BluetoothConnectionState.Connected,
        onPressed: () {
          bluetooth.connectToDevice(device.key, onSuccess: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('connectedDeviceId', device.key);

            Future.delayed(const Duration(seconds: 1), () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            });
          });
        }));

    return HeaderPage(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Typography.Header("Connect Sensor"),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            children: <Widget>[
              const SizedBox(height: 20),
              const Typography.Title("Nearby devices"),
              const SizedBox(height: 15),
              ...devices
            ],
          ))
        ]));
  }
}
