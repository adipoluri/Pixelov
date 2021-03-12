import 'package:flutter/material.dart';

class HideoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/raid.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
