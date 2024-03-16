import 'dart:convert';

import 'package:http/http.dart' as http;


import '../model/user_response_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.github.com/users/';

  static Future<UserDataResponseModel?> getData(String username) async {
    final response = await http.get(Uri.parse('$baseUrl' + username));

    if (response.statusCode == 200) {
      print("Search user response is" + response.body.toString());
      return UserDataResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print("Failed to load data");
      return null;
    }
  }


}
