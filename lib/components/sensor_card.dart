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
            padding: const EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFD9ECE1)),
            child: Column(
              children: <Widget>[
                Icon(icon, color: Color(0xFF0A5251), size: 60.0),
                const SizedBox(height: 10),
                enabled
                    ? Text(label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A5251)))
                    : const Text(''),
              ],
            ));
}
