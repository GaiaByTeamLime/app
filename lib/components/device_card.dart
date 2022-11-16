import 'package:flutter/material.dart';

class DeviceCard extends Container {
  DeviceCard(
      {Key? key,
      required String name,
      required String mac,
      required void Function() onPressed,
      bool isConnecting = false,
      bool isConnected = false})
      : super(
            key: key,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFD9ECE1)),
                    child: Container(
                        height: 70,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 10),
                            const Icon(Icons.radar,
                                size: 20.0, color: Color(0xFF0A5251)),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text(name,
                                      style: const TextStyle(
                                          color: Color(0xFF0A5251))),
                                  Text(mac,
                                      style: const TextStyle(
                                          color: Color(0xFF0A5251))),
                                ])),
                            isConnecting
                                ? const SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2))
                                : const Text(''),
                            isConnected
                                ? const Icon(Icons.check_circle, size: 15)
                                : const Text(''),
                            const SizedBox(width: 10),
                          ],
                        )))));
}
