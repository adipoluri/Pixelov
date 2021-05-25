import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixelov/core/authScreen.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/core/authService.dart';
import 'package:pixelov/extras/helpers.dart';
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
  //StreamSubscription tokenStream;
  bool _initialised = false;
  bool _error = false;

  void initialiseFlutterFire() async {
    try {
      dBhandler = new DBHandler();
      await Firebase.initializeApp();
      await dBhandler.initDB();
      await dBhandler.initData();
      //await dBhandler.initImages();
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
      return errorScreen();
    }

    if (!_initialised) {
      return loadingScreen();
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
        dBhandler.currentUser != null) {
      if (state == AppLifecycleState.paused) {
        //user offline
        //tokenStream.pause();
        dBhandler.currentUser.active = false;
        dBhandler.currentUser.lastOnlineTimestamp = DateTime.now();
        dBhandler.updateCurrentUser();
      } else if (state == AppLifecycleState.resumed) {
        //user online
        //tokenStream.resume();
        dBhandler.currentUser.active = true;
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
  bool _timerDone = false;
  bool _initialised = false;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<auth.User>();
    if (!_timerDone) {
      return loadingScreen();
    }

    if (firebaseUser == null) {
      return AuthScreen();
    }

    waitForUser();
    if (_initialised) {
      return MainMenu();
    } else {
      return loadingScreen();
    }
  }

  @override
  void initState() {
    waitForTimer();
    super.initState();
  }

  void waitForTimer() async {
    await timer();
    setState(() {
      _timerDone = true;
    });
  }

  waitForUser() async {
    await MyAppState.dBhandler.setCurrentUser();
    setState(() {
      _initialised = true;
    });
  }
}
