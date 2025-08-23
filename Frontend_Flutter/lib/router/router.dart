import 'package:app_routing/pages/age.dart';
import 'package:app_routing/pages/back_page.dart';
import 'package:app_routing/pages/child_page.dart';
import 'package:app_routing/pages/home_page.dart';
import 'package:app_routing/pages/login.dart';
import 'package:app_routing/pages/profile_page.dart';
import 'package:app_routing/pages/user_page.dart';
import 'package:app_routing/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorBuilder: (context, state) {
      return Scaffold(body: Center(child: Text("this page is not found")));
    },

    //redirect to login page if user is not logged on
    // redirect: (context, state) {
    //   bool isUserLoggedIn = UserData.isUserLoggedIn;
    //   if (isUserLoggedIn) {
    //     return "/";
    //   } else {
    //     return "/login";
    //   }
    // },
    routes: [
      //Home page
      GoRoute(
        name: "Home page",
        path: "/",
        builder: (context, state) {
          return HomePage();
        },
      ),

      // GoRoute(
      //   name: "profile page",
      //   path: "/profile",
      //   builder: (context, state) {
      //     return Profilepage();
      //   },
      //   routes: [
      //     GoRoute(
      //       name: 'Child page',
      //       path: "child",
      //       builder: (context, state) {
      //         return ChildPage();
      //       },
      //     ),
      //   ],
      // ),
      GoRoute(
        name: RouteNamesClass.profile,
        path: "/profile",
        builder: (context, state) {
          return Profilepage();
        },
        routes: [
          GoRoute(
            name: 'Child page',
            path: "child",
            builder: (context, state) {
              return ChildPage();
            },
          ),
        ],
      ),
      // //user page extra parameter
      // GoRoute(
      //   path: "/user",
      //   builder: (context, state) {
      //     // final String name = state.extra as String;
      //     final name = (state.extra as Map<String, dynamic>)["name"] as String;
      //     final age = (state.extra as Map<String, dynamic>)["age"] as int;
      //     return UserPage(userName: name, userAge: age);
      //   },
      // ),
      GoRoute(
        path: "/user/:name",
        builder: (context, state) {
          return UserPage(userName: state.pathParameters['name']!);
        },
      ),
      GoRoute(
        path: "/age",
        name: RouteNamesClass.ages,
        builder: (context, state) {
          final int ages = state.uri.queryParameters['ages'] == null
              ? 0
              : int.parse(state.uri.queryParameters['ages']!);
          return AgePage(ages: ages);
        },
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: "/back",
        builder: (context, state) {
          return const BackPage();
        },
      ),
    ],
  );
}
