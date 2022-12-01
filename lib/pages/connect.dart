// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bluetooth.dart';
import '../components/page.dart';
import '../components/device_card.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    Bluetooth bluetooth = Provider.of<Bluetooth>(context, listen: true);

    // When the page is rendered, start scanning if we aren't already scanning
    bluetooth.scan();

    var devices = bluetooth.foundDevices.entries
        .where((device) => device.value == "Gaia Plant Sensor")
        .map((device) => DeviceCard(
            name: device.value,
            mac: device.key,
            isConnecting: bluetooth.connectedDeviceId == device.key &&
                bluetooth.connectionState ==
                    BluetoothConnectionState.connecting,
            isConnected: bluetooth.connectedDeviceId == device.key &&
                bluetooth.connectionState == BluetoothConnectionState.connected,
            onPressed: () {
              bluetooth.connectToDevice(device.key, onSuccess: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('connectedDeviceId', device.key);

                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushNamed(context, '/');
                });
              });
            }));

    return WillPopScope(
      onWillPop: () async => false,
      child: ScrollableHeaderPage("Connect Sensor", <Widget>[
        const SizedBox(height: 20),
        const Typography.Title("Nearby devices"),
        const SizedBox(height: 15),
        ...devices
      ]),
    );
  }
}
