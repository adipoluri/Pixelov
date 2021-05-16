import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:pixelov/extras/helpers.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/widgets/raidScreen/badLands/badLandsScreen.dart';
import 'package:pixelov/widgets/raidScreen/scavRaidSelectorScreen.dart';

class RaidSelectorScreen extends StatefulWidget {
  @override
  _RaidSelectorScreenState createState() => _RaidSelectorScreenState();
}

class _RaidSelectorScreenState extends State<RaidSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = (MediaQuery.of(context).size.height / 3) - 120;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/raid.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    color: const Color(0xFF878787),
                    width: width,
                    height: 1.0,
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  Wrap(
                    runSpacing: 32,
                    children: [
                      RaidChooserColumn(),
                      badLandsButton(
                        context,
                        "Bad Lands",
                        width,
                        height,
                        'assets/images/badlands2.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton badLandsButton(BuildContext context, String title, double width,
      double height, String path) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, badLandsRoute(new BadLandsScreen()));
      },
      style: TextButton.styleFrom(
        primary: Color(0x5FFFFFFF), // background
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(24.0),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, height, 0, height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.white,
                  fontSize: 46,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RaidChooserColumn extends StatefulWidget {
  @override
  _RaidChooserColumnState createState() => _RaidChooserColumnState();
}

class _RaidChooserColumnState extends State<RaidChooserColumn> {
  Widget _choice;
  bool _finished = false;
  String _timeLeft;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = (MediaQuery.of(context).size.height / 3) - 180;

    if (_finished) {
      _choice = raidFinishedButton(
        context,
        MyAppState.dBhandler.currentUser.raid.raidCat,
        width,
        height,
        'assets/images/raidbutton.png',
      );
    } else if (MyAppState.dBhandler.currentUser.raid.pmcRaid ||
        MyAppState.dBhandler.currentUser.raid.scavRaid) {
      _choice = inRaidButton(
        context,
        MyAppState.dBhandler.currentUser.raid.raidCat,
        _timeLeft,
        width,
        height,
        'assets/images/raidbutton.png',
      );
    } else {
      _choice = raidButton(
        context,
        "Runs",
        width,
        height,
        'assets/images/raidbutton.png',
      );
    }
    return _choice;
  }

  @override
  void initState() {
    isRaidTimerDone();
    super.initState();
  }

  void isRaidTimerDone() {
    if (MyAppState.dBhandler.currentUser.raid.inRaid()) {
      if (MyAppState.dBhandler.currentUser.raid.isRaidTimerDone()) {
        setState(() {
          _finished = true;
        });
      } else {
        setState(() {
          Duration difference = MyAppState
              .dBhandler.currentUser.raid.raidDuration
              .difference(DateTime.now());
          _timeLeft = difference.toString().substring(0, 8);
        });
      }
    }
  }

  TextButton raidButton(BuildContext context, String title, double width,
      double height, String path) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, transitionRoute(new ScavRaidSelectorScreen()));
      },
      style: TextButton.styleFrom(
        primary: Color(0x00FFFFFF), // background
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(24.0),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
            image: AssetImage(path),
            fit: BoxFit.fill,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, height, 0, height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton inRaidButton(BuildContext context, String title, String time,
      double width, double height, String path) {
    return TextButton(
      onPressed: () {
        isRaidTimerDone();
      },
      style: TextButton.styleFrom(
        primary: Color(0x00FFFFFF), // background
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(24.0),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, height, 0, height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              GlowText(
                "$time left",
                blurRadius: 3,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Text(
                "Click to refresh",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton raidFinishedButton(BuildContext context, String title,
      double width, double height, String path) {
    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(
        primary: Color(0x00FFFFFF), // background
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(24.0),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, height, 0, height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Text(
                "Raid Summary",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
