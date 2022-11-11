import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SensorCard extends Container {
  SensorCard({required String label, required bool enabled, required IconData icon, required Color color})
      : super(
            child: Expanded(
                child: Card(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: <Widget>[
                            Icon(icon, color: enabled ? color : Colors.grey, size: 60.0),
                            SizedBox(height: 10),
                            enabled ? Text(label) : Text(''),
                          ],
                        )))));
}
