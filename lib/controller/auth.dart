import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class AuthController {
  AuthController._privateConstructor();
  static final AuthController _instance = AuthController._privateConstructor();

  factory AuthController() {
    return _instance;
  }

  Future<String?> registerNewToken(String mac) async {
    var jwt = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
    var res = await get(
      Uri.https("auth.dev.gaiaplant.app", "/create/$mac"),
      headers: {"Authorization": "Bearer $jwt"},
    );

    switch (res.statusCode) {
      case 200:
        return res.body;

      case 500:
      case 403:
      default:
        return null;
    }
  }
}
