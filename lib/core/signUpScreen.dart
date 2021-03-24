import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/extras/helpers.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/model/user.dart';
import 'package:pixelov/widgets/mainMenuScreen/MainMenu.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_PRIMARY),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: new Form(
            key: _key,
            autovalidateMode: _validate,
            child: formUI(),
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return new Column(
      children: <Widget>[
        new Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Create new account',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontFamily: 'Minecraft',
                fontSize: 25.0),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              validator: validateEmail,
              onSaved: (String val) {
                email = val;
              },
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                fillColor: Colors.white,
                hintText: 'Email Address',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              controller: _passwordController,
              validator: validatePassword,
              onSaved: (String val) {
                password = val;
              },
              style:
                  TextStyle(height: 0.8, fontSize: 18.0, color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                fillColor: Colors.white,
                hintText: 'Password',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                _sendToServer();
              },
              obscureText: true,
              validator: (val) =>
                  validateConfirmPassword(_passwordController.text, val),
              onSaved: (String val) {
                confirmPassword = val;
              },
              style:
                  TextStyle(height: 0.8, fontSize: 18.0, color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                fillColor: Colors.white,
                hintText: 'Confirm Password',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(COLOR_PRIMARY),
                onPrimary: Colors.white,
                onSurface: Color(COLOR_PRIMARY),
                padding: EdgeInsets.only(top: 12, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.white)),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Minecraft',
                    fontWeight: FontWeight.normal),
              ),
              onPressed: _sendToServer,
            ),
          ),
        ),
      ],
    );
  }

  _sendToServer() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      try {
        auth.UserCredential result = await auth.FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.trim(), password: password.trim());
        User user = User(
          email: email,
          userID: result.user.uid,
          active: true,
        );

        await MyAppState.dBhandler.updateUser(user);

        pushAndRemoveUntil(context, MainMenu(), false);
      } on auth.FirebaseAuthException catch (error) {
        String message = 'Couldn\'t sign up';
        switch (error.code) {
          case 'email-already-in-use':
            message = 'Email address already in use';
            break;
          case 'invalid-email':
            message = 'validEmail';
            break;
          case 'operation-not-allowed':
            message = 'Email/password accounts are not enabled';
            break;
          case 'weak-password':
            message = 'password is too weak.';
            break;
          case 'too-many-requests':
            message = 'Too many requests, '
                'Please try again later.';
            break;
        }
        showAlertDialog(context, 'Failed', message);
        print(error.toString());
      } catch (e) {
        print('_SignUpState._sendToServer $e');
        showAlertDialog(context, 'Failed', 'Couldn\'t sign up');
      }
    } else {
      setState(() {
        _validate = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
