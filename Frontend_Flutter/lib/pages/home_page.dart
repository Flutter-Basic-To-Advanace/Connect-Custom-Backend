import 'package:app_routing/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Home page", style: TextStyle(fontSize: 20))),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go("/profile");
              GoRouter.of(context).goNamed(RouteNamesClass.profile);
            },
            child: Text("Go to Profile"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            },
            child: Text("Go to Child page"),
          ),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(
              //   context,
              // ).go("/user", extra: {"name": "sharada", "age": 24});
              String names = "sharada";
              GoRouter.of(context).go("/user/$names");
            },
            child: Text("Go to user  page"),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     GoRouter.of(
          //       context,
          //     ).goNamed(RouteNamesClass.ages, queryParameters: {"ages": "24"});
          //   },
          //   child: Text("Go to Age page"),
          // ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/back");
            },
            child: Text("Go to Back page"),
          ),
        ],
      ),
    );
  }
}
