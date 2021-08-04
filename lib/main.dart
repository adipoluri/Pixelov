import 'package:flutter/material.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/extras/helpers.dart';
import 'package:pixelov/model/user.dart';
import 'package:pixelov/widgets/mainMenuScreen/MainMenu.dart';
import 'package:desktop_window/desktop_window.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   DesktopWindow.setWindowSize(Size(400,800));
   DesktopWindow.setMinWindowSize(Size(400,800));
   DesktopWindow.setMaxWindowSize(Size(400,800));

  runApp(MyApp());
}


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
      await dBhandler.initDB();
      await dBhandler.initData();
      //await dBhandler.initImages();
      await timer();
      setState(() {
        _initialised = true;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (_error) {
      return errorScreen();
    }

    if (!_initialised) {
      return loadingScreen();
    }

    return MaterialApp(
        home: AuthenticationWrapper());
      
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
}

//Handles pathing between auth and main app
class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool _timerDone = false;
  bool _initialised = false;
  bool _noData = false;

  @override
  Widget build(BuildContext context) {
    if (!_timerDone) {
      return loadingScreen();
    }

    if (_initialised) {
      return MainMenu();
    } else {
      waitForGetUser();
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

  waitForGetUser() async {
    User user = MyAppState.dBhandler.createNewUser("TEMP", "12345");
    await MyAppState.dBhandler.putUserinDB(user);

    setState(() {
        _initialised = true;
    });
  }

}
