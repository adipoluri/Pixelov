import 'package:flutter/material.dart';
import 'package:pixelov/widgets/MainMenu.dart';
import 'package:pixelov/widgets/raidScreen/raidSelectorScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}
