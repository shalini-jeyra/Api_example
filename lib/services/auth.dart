import 'dart:convert';
import 'package:api_example/services/global.dart';
import 'package:http/http.dart' as http;
import 'package:api_example/models/models.dart';

class AuthService {
  Future<bool> login(String user, String pass) async {
    final response = await http.post(
      Uri.parse(
          'https://rimsauth.accruontechnologies.co.in/auth/realms/rims/protocol/openid-connect/token'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "grant_type": "password",
        "client_id": "rims_app",
        "username": user,
        "password": pass
      },
    );

    if (response.statusCode == 200) {
      
      Global.boxes[BOX_NAME.USER_ACCESS]!.put(
          'access_token', Auth.fromJson(jsonDecode(response.body)).accessToken);
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return false;
    }
  }
}
