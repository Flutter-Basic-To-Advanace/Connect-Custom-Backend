import 'package:flutter/material.dart';

class AgePage extends StatelessWidget {
  final int ages;
  const AgePage({super.key, required this.ages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("ages is : $ages")));
  }
}
