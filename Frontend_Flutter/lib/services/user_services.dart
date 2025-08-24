import 'dart:convert';

import 'package:frontend_flutter/model/user_model.dart';
import 'package:http/http.dart' as http;

final baseUrl = "http://192.168.1.5:5000/api/user/create";

class UserServices {
  //create user
  Future<void> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toJson()),
      );

      if (response.statusCode != 201) {
        print('Failed to create User: ${response.statusCode}');
        throw Exception('Failedto create user');
      } else {
        print('user creating');
      }
    } catch (error) {
      print("Error creating user: $error");
      rethrow;
    }
  }
}
