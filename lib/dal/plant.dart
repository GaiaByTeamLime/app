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
    required this.name,
    required this.avatarPot,
    required this.plantPot,
    required this.facePot,
    required this.calibrationDry,
    required this.calibrationWet,
  });

  @Id()
  final String id;
  final String name;
  final int avatarPot;
  final int plantPot;
  final int facePot;
  final int calibrationDry;
  final int calibrationWet;
}

@Collection<PlantDTO>('plants')
final plantRef = PlantCollectionReference();
