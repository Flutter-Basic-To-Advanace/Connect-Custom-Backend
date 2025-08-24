import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/user_model.dart';
import 'package:frontend_flutter/services/user_services.dart';

class UserProvider with ChangeNotifier {
  final UserServices _userServices = UserServices();
  final List<User> _users = [];

  //getter
  List<User> get users => _users;

  //TODO:Fetch users when the provider is initailized

  //create user
  Future<void> addUser(User user) async {
    try {
      await _userServices.createUser(user);
      _users.add(user);
      notifyListeners();
    } catch (error) {
      print("Failed to add user: $error");
    }
  }
}
