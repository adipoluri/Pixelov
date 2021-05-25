import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/extras/helpers.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/model/location.dart';

class LocationRow extends StatelessWidget {
  final Location location;
  final int level;

  LocationRow(this.location, this.level);

  @override
  Widget build(BuildContext context) {
    final locationCard = new Container(
      decoration: new BoxDecoration(
        color: Color(COLOR_PRIMARY),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          image: AssetImage(location.image),
          fit: BoxFit.cover,
        ),
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(location.name, style: TextStyles.locationTitle),
            new Text(location.description, style: TextStyles.locationSubText),
            new Container(
              color: const Color(COLOR_PRIMARY),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.whatshot, size: 14.0, color: Colors.red),
                new Text(" Difficulty: ${location.difficulty}",
                    style: TextStyles.locationSubHeading),
                new Container(width: 24.0),
                new Icon(Icons.access_time, size: 14.0, color: Colors.blue),
                new Text("  ${location.raidHours}h ${location.raidMins}m",
                    style: TextStyles.locationSubHeading),
              ],
            ),
          ],
        ),
      ),
    );

    final locationCardExtra = new Container(
      decoration: new BoxDecoration(
        color: Color(COLOR_PRIMARY).withAlpha(200),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text("Unlock ${location.name} at level ${location.minLevel}",
              style: TextStyles.locationSubText),
        ],
      ),
    );

    Stack retVal;
    if (this.level >= location.minLevel) {
      retVal = new Stack(
        children: <Widget>[
          locationCard,
        ],
      );
    } else {
      retVal = new Stack(
        children: <Widget>[
          locationCard,
          locationCardExtra,
        ],
      );
    }

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new TextButton(
        onPressed: () {
          if (this.level >= location.minLevel) {
            Navigator.push(context, transitionRoute(raidInfo(context)));
          }
        },
        child: retVal,
      ),
    );
  }

  Widget raidInfo(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 120;
    double height = MediaQuery.of(context).size.height / 3;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(COLOR_PRIMARY),
          title: Text(
            "${location.name} Raid",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              fontFamily: 'Minecraft',
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "SCAV"),
              Tab(text: "PMC"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(COLOR_PRIMARY),
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage(location.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Scav Raid",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      fontFamily: 'Minecraft',
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                  new Container(
                    height: 24.0,
                  ),
                  new Text(
                    "Estimated Raid Time:",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      fontFamily: 'Minecraft',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  new Container(
                    height: 12.0,
                  ),
                  new Text(
                    "${location.raidHours}h ${location.raidMins}m",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      fontFamily: 'Minecraft',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  new Container(
                    color: const Color(COLOR_PRIMARY),
                    width: width,
                    height: 1.0,
                    margin: const EdgeInsets.symmetric(vertical: 24.0),
                  ),
                  launchButton(context, width, height),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(COLOR_PRIMARY),
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage(location.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton launchButton(
      BuildContext context, double width, double height) {
    return ElevatedButton(
      onPressed: () {
        MyAppState.dBhandler.currentUser.raid.startScavRaid(location.name);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Color(COLOR_PRIMARY), // background
        onPrimary: Color(0xFFE9E9E9), // foreground
      ),
      child: Container(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlowText(
                "Start Raid",
                blurRadius: 50,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Color(0xFFE9E8D3),
                  fontSize: 65,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
