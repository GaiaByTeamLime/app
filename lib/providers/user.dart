import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier {
  double wet = 0, dry = 0;
  int pot = 0, plant = 0, face = 0, accessories1 = 0, accessories2 = 0;

  Future<void> update() async {
    final prefs = await SharedPreferences.getInstance();
    wet = prefs.getDouble('wet') ?? 0;
    dry = prefs.getDouble('dry') ?? 0;
    pot = prefs.getInt('pot') ?? 0;
    plant = prefs.getInt('plant') ?? 0;
    face = prefs.getInt('face') ?? 0;
    accessories1 = prefs.getInt('accessories1') ?? 12;
    accessories2 = prefs.getInt('accessories2') ?? 6;
  }

  Future<void> setFace(int i) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('face', i);
    await update();
    notifyListeners();
  }

  Future<void> setPot(int i) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('pot', i);
    await update();
    notifyListeners();
  }

  Future<void> setPlant(int i) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('plant', i);
    await update();
    notifyListeners();
  }

  void setAccessories1(int i) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('accessories1', i);
    await update();
    notifyListeners();
  }

  void setAccessories2(int i) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('accessories2', i);
    await update();
    notifyListeners();
  }
}
