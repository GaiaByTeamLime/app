import 'package:flutter/material.dart';
// ignore: library_prefixes
import '../bluetooth.dart' as Bluetooth;
import '../components/typography.dart' as Typography;
import '../components/page.dart';
import '../components/device_card.dart';

class ConnectPage extends StatefulWidget {
  final Bluetooth.Bluetooth bluetooth;
  const ConnectPage(this.bluetooth, {Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  Map<String, String> foundDevices = {};

  void scan() {
    widget.bluetooth.cancelScanning();
    widget.bluetooth.scan((String deviceId, String name) {
      setState(() {
        foundDevices[deviceId] = name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // When the page is rendered, start scanning if we aren't already scanning
    if (widget.bluetooth.connectionState ==
        Bluetooth.BluetoothConnectionState.Idle) scan();

    var devices = foundDevices.entries.map((device) => DeviceCard(
        name: device.key,
        mac: device.value,
        isConnecting: widget.bluetooth.connectedDeviceId == device.key &&
            widget.bluetooth.connectionState ==
                Bluetooth.BluetoothConnectionState.Scanning,
        isConnected: widget.bluetooth.connectedDeviceId == device.key &&
            widget.bluetooth.connectionState ==
                Bluetooth.BluetoothConnectionState.Connected,
        onPressed: () {
          setState(() {
            widget.bluetooth.connectToDevice(device.key);
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
              Text(widget.bluetooth.connectionState.toString()),
              const SizedBox(height: 15),
              ...devices,
              ElevatedButton(
                child: Text('disconnect'),
                onPressed: () {},
              )
            ],
          ))
        ]));
  }
}
