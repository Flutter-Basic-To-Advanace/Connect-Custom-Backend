import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String userName;
  // final int userAge;
  const UserPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("UserName : $userName  ")));
  }
}
