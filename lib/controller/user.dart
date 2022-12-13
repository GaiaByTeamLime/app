import 'package:firebase_auth/firebase_auth.dart';

import '../dal/user.dart';

class UserController {
  UserController._privateConstructor();
  static final UserController _instance = UserController._privateConstructor();
  static final _auth = FirebaseAuth.instance;

  factory UserController() {
    return _instance;
  }

  Future<UserDTO?> get _self async {
    if (_auth.currentUser == null) return null;

    final uid = _auth.currentUser?.uid;
    var doc = usersRef.doc(uid);
    var snapshot = await doc.get();
    return snapshot.data ?? UserDTO(plants: [], id: uid!);
  }

  Future<String?> getPlant() async {
    try {
      return (await _self)?.plants.first;
    } on StateError catch (_) {
      return null;
    }
  }

  Future<void> setPlant(String mac) async {
    if (_auth.currentUser == null) return;

    final uid = (_auth.currentUser?.uid)!;

    var updatedUser = (await _self)!;
    updatedUser.plants = [mac];

    await usersRef.doc(uid).set(updatedUser);
  }
}
