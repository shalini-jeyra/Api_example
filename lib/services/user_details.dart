import 'dart:convert';

import 'package:api_example/models/user_details.dart';
import 'package:api_example/services/global.dart';
import 'package:http/http.dart' as http;

class UserDetailsService{
  Future<UserDetails> fetchUserDetails() async {
  final response = await http
      .get(Uri.parse('https://rimsapi.accruontechnologies.co.in/api/v1/common/getUser'),headers:{
        "Authorization":"Bearer ${Global.boxes[BOX_NAME.USER_ACCESS]!.get('access_token')}"
      } );
      
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   
    print(response.body);
    return  UserDetails.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
}