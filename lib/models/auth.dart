import 'dart:convert';

class Auth {

  final String accessToken;

  Auth({ required this.accessToken});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
    
      accessToken: json['access_token'],
    );
  }
}
