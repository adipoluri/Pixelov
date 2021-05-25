import 'package:flutter/material.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/model/locations.dart';

import 'locationRow.dart';

class ScavRaidSelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF141215),
        title: Text(
          "Pick a location!",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            fontFamily: 'Minecraft',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/raid.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: Locations.locations.length,
          itemBuilder: (_, index) => new LocationRow(Locations.locations[index],
              MyAppState.dBhandler.currentUser.experience.level),
        ),
      ),
    );
  }
}
