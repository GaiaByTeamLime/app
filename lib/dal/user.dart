import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'user.g.dart';

typedef BluetoothDevice = String;

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
);

@firestoreSerializable
class UserDTO {
  UserDTO({
    required this.plants,
    required this.id,
  });

  @Id()
  final String id;
  final List<BluetoothDevice> plants;
}

@Collection<UserDTO>('users')
final usersRef = UserCollectionReference();
