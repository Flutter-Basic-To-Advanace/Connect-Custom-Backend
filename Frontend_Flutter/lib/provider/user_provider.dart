import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/user_model.dart';
import 'package:frontend_flutter/services/user_services.dart';

class UserProvider with ChangeNotifier {
  final UserServices _userServices = UserServices();
  List<User> _users = [];

  //getter
  List<User> get users => _users;

  //Fetch users when the provider is initailized
  UserProvider() {
    fetchAllUsers();
  }

  //fetch all users
  Future<void> fetchAllUsers() async {
    try {
      _users = await _userServices.getAllUsers();
      notifyListeners();
    } catch (error) {
      print("Failed to fetch users: $error");
    }
  }

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

  //delete user
  Future<void> deleteUser(String userId) async {
    try {
      await _userServices.deleteUser(userId);
      _users.removeWhere((user) => user.id == userId);

      notifyListeners();
    } catch (error) {
      print("Failed to delete user : $error");
    }
  }
}
