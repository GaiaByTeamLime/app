import 'package:gaia/controller/user.dart';

import '../dal/plant.dart';

class PlantController {
  PlantController._privateConstructor();
  static final PlantController _instance =
      PlantController._privateConstructor();

  factory PlantController() {
    return _instance;
  }

  Future<PlantDTO?> get self async {
    final plant = await UserController().getPlant();
    if (plant == null) return null;

    var doc = plantRef.doc(plant);
    var snapshot = await doc.get();
    return snapshot.data ??
        PlantDTO(
          id: plant,
          /* */
          calibrationDry: 0,
          calibrationWet: 0,
          humidity: 0,
          illumination: 0,
          soilHumidity: 0,
          soilSalt: 0,
          temperature: 0,
          voltage: 0,
          /* */
          avatarAccessories1: 12,
          avatarAccessories2: 6,
          avatarFace: 0,
          avatarPlant: 0,
          avatarPot: 0,
          name: 'Bobbie',
        );
  }

  Future<String?> getId() async => (await self)?.id;

  Future<int?> getCalibrationDry() async => (await self)?.calibrationDry;
  Future<int?> getCalibrationWet() async => (await self)?.calibrationWet;
  Future<double?> getHumidity() async => (await self)?.humidity;
  Future<double?> getIllumination() async => (await self)?.illumination;
  Future<double?> getSoilHumidity() async => (await self)?.soilHumidity;
  Future<double?> getSoilSalt() async => (await self)?.soilSalt;
  Future<double?> getTemperature() async => (await self)?.temperature;
  Future<double?> getVoltage() async => (await self)?.voltage;

  Future<int?> getAvatarAccessories1() async =>
      (await self)?.avatarAccessories1;
  Future<int?> getAvatarAccessories2() async =>
      (await self)?.avatarAccessories2;
  Future<int?> getAvatarFace() async => (await self)?.avatarFace;
  Future<int?> getAvatarPlant() async => (await self)?.avatarPlant;
  Future<int?> getAvatarPot() async => (await self)?.avatarPot;
  Future<String?> getName() async => (await self)?.name;

  Future<void> setCalibrationDry(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.calibrationDry = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setCalibrationWet(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.calibrationWet = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setAvatarAccessories1(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.avatarAccessories1 = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setAvatarAccessories2(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.avatarAccessories2 = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setAvatarFace(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.avatarFace = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setAvatarPlant(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.avatarPlant = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setAvatarPot(int value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.avatarPot = value;

    await plantRef.doc(plant).set(updatedPlant);
  }

  Future<void> setName(String value) async {
    final plant = await UserController().getPlant();
    if (plant == null) return;

    var updatedPlant = (await self)!;
    updatedPlant.name = value;

    await plantRef.doc(plant).set(updatedPlant);
  }
}
