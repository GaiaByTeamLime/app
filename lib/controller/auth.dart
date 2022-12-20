import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NewSensorResponse {
  late String token;
  late String uid;

  NewSensorResponse({required this.token, required this.uid});

  NewSensorResponse.fromJson(Map json) {
    token = json['token'];
    uid = json['uid'];
  }
}

class AuthController {
  AuthController._privateConstructor();
  static final AuthController _instance = AuthController._privateConstructor();

  factory AuthController() {
    return _instance;
  }

  Future<NewSensorResponse?> registerNewSensor() async {
    var jwt = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
    var res = await get(
      Uri.https("auth.prod.gaiaplant.app", "/create"),
      headers: {"Authorization": "Bearer $jwt"},
    );

    switch (res.statusCode) {
      case 200:
        var response = jsonDecode(res.body);
        return NewSensorResponse.fromJson(response);

      case 500:
      case 403:
      default:
        return null;
    }
  }
}
