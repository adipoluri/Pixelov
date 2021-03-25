import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/core/authScreen.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/core/authService.dart';
import 'package:pixelov/extras/helpers.dart';
import 'package:pixelov/model/time.dart';
import 'package:pixelov/widgets/mainMenuScreen/MainMenu.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static DBHandler dBhandler;
  StreamSubscription tokenStream;

  bool _initialised = false;
  bool _error = false;

  void initialiseFlutterFire() async {
    try {
      dBhandler = new DBHandler();
      await Firebase.initializeApp();
      await dBhandler.initDB();
      await timer();

      setState(() {
        _initialised = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (_error) {
      return MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 25,
                ),
                SizedBox(height: 16),
                Text(
                  'Failed to initialise firebase!',
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              ],
            )),
          ),
        ),
      );
    }

    if (!_initialised) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/launch.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Color(COLOR_PRIMARY),
            ),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(auth.FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: null,
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }

  @override
  void initState() {
    initialiseFlutterFire();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (auth.FirebaseAuth.instance.currentUser != null &&
        DBHandler.currentUser != null) {
      if (state == AppLifecycleState.paused) {
        //user offline
        tokenStream.pause();
        DBHandler.currentUser.active = false;
        DBHandler.currentUser.lastOnlineTimestamp = new Time(
            DateTime.now().month, DateTime.now().day, DateTime.now().year);
        dBhandler.updateCurrentUser();
      } else if (state == AppLifecycleState.resumed) {
        //user online
        tokenStream.resume();
        DBHandler.currentUser.active = true;
        dBhandler.updateCurrentUser();
      }
    }
  }
}

//Handles pathing between auth and main app
class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  final firebaseUser = null;
  bool _ready = false;
  Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<auth.User>();
    if (!_ready) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/launch.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Color(COLOR_PRIMARY),
            ),
          ),
        ),
      );
    }
    if (firebaseUser != null) {
      MyAppState.dBhandler.setCurrentUser();
      return MainMenu();
    } else {
      return AuthScreen();
    }
  }

  @override
  void initState() {
    waitForUser();
    super.initState();
  }

  void waitForUser() async {
    await timer();
    setState(() {
      _ready = true;
    });
  }
}
