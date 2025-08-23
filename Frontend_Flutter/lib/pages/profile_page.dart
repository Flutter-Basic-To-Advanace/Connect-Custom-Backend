import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Profile page", style: TextStyle(fontSize: 20))),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/");
            },
            child: Text("Go to Home"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            },
            child: Text("Go to Child page"),
          ),
        ],
      ),
    );
  }
}
