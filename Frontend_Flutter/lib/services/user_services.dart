import 'dart:convert';

import 'package:frontend_flutter/model/user_model.dart';
import 'package:http/http.dart' as http;

final baseUrl1 = "http://192.168.1.5:5000/api/user/create";
final baseUrl2 = "http://192.168.1.5:5000/api/user/getAllUsers";

class UserServices {
  //create user
  Future<void> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl1),
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

  //Get all users
  Future<List<User>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl2));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        print('Failed to load users : ${response.statusCode}');
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error fetching users : $error');
      rethrow;
    }
  }
}
