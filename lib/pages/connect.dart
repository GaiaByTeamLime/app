// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../controller/auth.dart';
import '../controller/user.dart';
import '../providers/blufi.dart';
import '../components/page.dart';
import '../components/device_card.dart';
import 'package:provider/provider.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  var shownMessage = false;

  Future<bool> _askForPermissions() async {
    var bluetoothScan = await Permission.bluetoothScan.request().isGranted;
    var bluetoothConnect =
        await Permission.bluetoothConnect.request().isGranted;
    var location = await Permission.location.request().isGranted;

    return bluetoothConnect && bluetoothScan && location;
  }

  @override
  Widget build(BuildContext context) {
    if (shownMessage) {
      return FutureBuilder<bool?>(
        future: _askForPermissions(),
        builder: (context, snapshot) {
          var errorPage = ScrollableHeaderPage("", [
            const Text('You denied some permissions'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Try again'),
            ),
          ]);

          if (snapshot.hasData) {
            return snapshot.data! ? const ConnectBluetoothPage() : errorPage;
          } else if (snapshot.hasError) {
            return errorPage;
          } else {
            return ScrollableHeaderPage("", const [
              Text('Loading permissions...'),
            ]);
          }
        },
      );
    } else {
      return ScrollableHeaderPage("Permissions", [
        const SizedBox(height: 40),
        const Text('Please accept the following permissions:'),
        const SizedBox(height: 10),
        const Text('- Location'),
        const SizedBox(height: 10),
        const Text('- Bluetooth'),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                shownMessage = true;
              });
            },
            child: const Text('Continue'),
          ),
        ),
      ]);
    }
  }
}

class ConnectBluetoothPage extends StatefulWidget {
  const ConnectBluetoothPage({super.key});

  @override
  State<ConnectBluetoothPage> createState() => _ConnectBluetoothPageState();
}

class _ConnectBluetoothPageState extends State<ConnectBluetoothPage> {
  var _timePassed = 0;
  Timer? _timer;

  void _startTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timePassed++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) return ScrollableHeaderPage("", const []);

    _startTimer();

    Blufi blufi = Provider.of<Blufi>(context, listen: true);

    // When the page is rendered, start scanning if we aren't already scanning
    blufi.scan();

    var devices = blufi.foundDevices.entries
        .where((device) => device.value == "BLUFI_DEVICE")
        .map(
          (device) => DeviceCard(
            title: "Gaia Plant Sensor", //device.value,
            subtitle: device.key,
            isConnecting: blufi.connectedDeviceId == device.key &&
                blufi.connectionState ==
                    BlufiConnectionState.connectingBluetooth,
            isConnected: blufi.connectedDeviceId == device.key &&
                blufi.connectionState ==
                    BlufiConnectionState.connectedBluetooth,
            onPressed:
                blufi.connectionState == BlufiConnectionState.scanningBluetooth
                    ? () {
                        blufi.connectToDevice(device.key, onSuccess: () {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushNamed(context, "/connect/wifi");
                          });
                        });
                      }
                    : null,
          ),
        );

    return WillPopScope(
      onWillPop: () async => false,
      child: ScrollableHeaderPage("Connect Sensor", <Widget>[
        const SizedBox(height: 20),
        const Typography.Title("Nearby devices"),
        const SizedBox(height: 15),
        ...devices,
        if (devices.isEmpty)
          Column(children: [
            const Padding(
                padding: EdgeInsets.all(20), child: LinearProgressIndicator()),
            const Text('Scanning for sensors...', textAlign: TextAlign.center),
            if (_timePassed > 20)
              Column(children: const [
                SizedBox(height: 10),
                Text(
                  'Sensor not showing up? Press the top button on your sensor once to restart it.',
                  textAlign: TextAlign.center,
                ),
              ]),
          ]),
        const SizedBox(height: 20),
      ]),
    );
  }
}

class ConnectWifiPage extends StatefulWidget {
  const ConnectWifiPage({super.key});

  @override
  State<ConnectWifiPage> createState() => _ConnectWifiPageState();
}

class _ConnectWifiPageState extends State<ConnectWifiPage> {
  var promptingPassword = false;

  int timePassed = 0;
  String? _deviceId;

  @override
  void dispose() {
    Blufi().disconnect();
    super.dispose();
  }

  Future<String?> _promptPassword(
      BuildContext context, String networkName) async {
    var controller = TextEditingController();
    return await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(networkName),
            content: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              controller: controller,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColorLight),
                  child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, controller.text);
                },
                child: const Text('Connect'),
              ),
            ],
          );
        });
  }

  Future<void> _showReconnect(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Something went wrong"),
          content: const Text(
              'The sensor could not scan for wifi networks. Please reset the sensor by pressing the top button, and then press retry.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/connect');
              },
              child: const Text('Retry'),
            ),
          ],
        );
      });

  Future<void> _showIncorrectPassword(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Password incorrect"),
          content: const Text(
              'The sensor could not connect to the WiFi network, please double check the password entered.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            ),
          ],
        );
      });

  Future<void> _showConnectionSuccess(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Connection successful!"),
          content: const Text('Your sensor is now connected to WiFi.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      });

  var _canTryAutoFix = 0;

  @override
  Widget build(BuildContext context) {
    Blufi blufi = Provider.of<Blufi>(context, listen: true);

    // Save a copy of the deviceId that we're connecting to
    _deviceId ??= blufi.connectedDeviceId;

    // When the page is rendered, start scanning for Wifi if we weren't doing that already.
    if (!promptingPassword) {
      blufi.scanForWifiNetworks(onError: () {
        if (_canTryAutoFix < 1 && _deviceId != null) {
          // Everything is disconnected so we should try again.
          blufi.scan();
          Future.delayed(const Duration(seconds: 5), () {
            blufi.connectToDevice(_deviceId!);

            Future.delayed(const Duration(seconds: 10), () {
              if (blufi.foundNetworks.isEmpty) {
                blufi.stopWifiScanning();
                blufi.disconnect();
                _showReconnect(context);
              }
            });
          });
          _canTryAutoFix++;
        } else {
          blufi.disconnect();
          _showReconnect(context);
        }
      });
    }

    var devices = blufi.foundNetworks.entries.map(
      (device) => DeviceCard(
        title: device.key,
        icon: Icons.wifi,
        isConnecting: blufi.connectedSsid == device.key &&
            blufi.connectionState == BlufiConnectionState.connectingWifi,
        isConnected: blufi.connectedSsid == device.key &&
            blufi.connectionState == BlufiConnectionState.connected,
        onPressed: blufi.connectionState == BlufiConnectionState.scanningWifi
            ? () async {
                print("COnnecting,.......");
                promptingPassword = true;
                var password = await _promptPassword(context, device.key);
                if (password != null) {
                  print("connect to wifi,.......");
                  blufi.connectToWifiNetwork(
                    device.key,
                    password,
                    onSuccess: () async {
                      var token = await AuthController().registerNewSensor();
                      if (token != null) {
                        print('token: ${token.token} with uid ${token.uid}');
                        blufi.registerAuthToken(
                          token.token,
                          token.uid,
                          onSuccess: () async {
                            await UserController().setPlant(token.uid);

                            // ignore: use_build_context_synchronously
                            await _showConnectionSuccess(context);
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, '/');
                          },
                          onError: (Object? e) async {
                            print(
                                "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE3 $e");
                            promptingPassword = false;
                            _showReconnect(context);
                          },
                        );
                      } else {
                        print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2");
                        promptingPassword = false;
                        // ignore: use_build_context_synchronously
                        _showReconnect(context);
                      }
                    },
                    onError: (e) async {
                      print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE $e");
                      promptingPassword = false;
                      _showReconnect(context);
                    },
                    onTimeout: () async {
                      promptingPassword = false;
                      _showIncorrectPassword(context);
                    },
                  );
                } else {
                  print("nahhhhhh,.......");
                  promptingPassword = false;
                }
              }
            : null,
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: ScrollableHeaderPage("Connect Sensor", <Widget>[
        const SizedBox(height: 20),
        const Typography.Title("Nearby WiFi networks"),
        const SizedBox(height: 15),
        ...devices,
        const Padding(
            padding: EdgeInsets.all(20), child: LinearProgressIndicator()),
        const Text(
          'Scanning for networks...',
          textAlign: TextAlign.center,
        ),
        const Text(
          'This might take a moment.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
