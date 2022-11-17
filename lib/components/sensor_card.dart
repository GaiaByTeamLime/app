import 'package:flutter/material.dart';

class SensorCard extends Container {
  SensorCard(
      {Key? key,
      required String label,
      required bool enabled,
      required IconData icon,
      required Color color})
      : super(
            key: key,
            child: Expanded(
                child: Card(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: <Widget>[
                            Icon(icon,
                                color: enabled ? color : Colors.grey,
                                size: 60.0),
                            const SizedBox(height: 10),
                            enabled ? Text(label) : const Text(''),
                          ],
                        )))));
}
