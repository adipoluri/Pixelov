import 'package:flutter/material.dart';
import 'package:pixelov/constants.dart';
import 'package:pixelov/core/helpers.dart';
import 'package:pixelov/core/loginScreen.dart';
import 'package:pixelov/core/signUpScreen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_PRIMARY),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.api,
              size: 150,
              color: Colors.white,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 8),
            child: Text(
              'Welcome to Pixelov!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontFamily: 'Minecraft',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(COLOR_PRIMARY),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.white)),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Minecraft',
                      fontWeight: FontWeight.normal),
                ),
                onPressed: () => push(context, new LoginScreen()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 40.0, left: 40.0, top: 20, bottom: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: TextButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Minecraft',
                      color: Color(COLOR_PRIMARY)),
                ),
                onPressed: () => push(context, new SignUpScreen()),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Color(COLOR_PRIMARY)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
