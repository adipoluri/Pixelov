import 'package:flutter/material.dart';
import 'package:pixelov/core/authScreen.dart';
import 'package:pixelov/core/authenticationService.dart';
import 'package:pixelov/core/helpers.dart';

class SettingsScreen extends StatelessWidget {
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
          child: ElevatedButton(
            onPressed: () {
              signOut();
              pushAndRemoveUntil(context, new AuthScreen(), false);
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0x1AFFFFFF), // background
              onPrimary: Color(0xFFB6A26A), // foreground
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Out',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            fontFamily: 'Minecraft',
                            color: Color(0xFFE9E8D3),
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
