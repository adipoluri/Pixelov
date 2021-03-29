import 'package:flutter/material.dart';
import 'package:pixelov/core/authScreen.dart';
import 'package:pixelov/core/authService.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/extras/helpers.dart';
import 'package:pixelov/main.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings3.dart";
  final TextStyle headerStyle = TextStyle(
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Minecraft',
    color: Colors.black,
    fontSize: 22,
  );
  final TextStyle subtextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Minecraft',
    color: Colors.black,
    fontSize: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color(COLOR_PRIMARY),
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            fontFamily: 'Minecraft',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ACCOUNT",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/raid.png"),
                    ),
                    title: Text(
                      MyAppState.dBhandler.currentUser.email,
                      style: subtextStyle,
                    ),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Colors.green,
                    value: false,
                    title: Text(
                      "Save Account",
                      style: subtextStyle,
                    ),
                    onChanged: null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "PUSH NOTIFICATIONS",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Colors.green,
                    value: true,
                    title: Text(
                      "Receive Notifications",
                      style: subtextStyle,
                    ),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  "Logout",
                  style: subtextStyle,
                ),
                onTap: () {
                  signOut();
                  MyAppState.dBhandler.clearDb();
                  pushAndRemoveUntil(context, new AuthScreen(), false);
                },
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}
