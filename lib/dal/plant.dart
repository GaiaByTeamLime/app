import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'plant.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
);

@firestoreSerializable
class PlantDTO {
  PlantDTO({
    required this.id,
    /* */
    required this.calibrationDry,
    required this.calibrationWet,
    required this.illumination,
    required this.humidity,
    required this.soilHumidity,
    required this.soilSalt,
    required this.temperature,
    required this.voltage,
    /* */
    required this.name,
    required this.avatarPot,
    required this.avatarPlant,
    required this.avatarFace,
    required this.avatarAccessories1,
    required this.avatarAccessories2,
  });

  @Id()
  final String id;
  int calibrationDry;
  int calibrationWet;

  final double illumination;
  final double humidity;
  final double temperature;
  final double voltage;
  final double soilHumidity;
  final double soilSalt;

  String name;
  int avatarPot;
  int avatarPlant;
  int avatarFace;
  int avatarAccessories1;
  int avatarAccessories2;
}

@Collection<PlantDTO>('plants')
final plantRef = PlantDTOCollectionReference();
