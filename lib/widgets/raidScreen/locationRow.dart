import 'package:flutter/material.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/model/location.dart';

class LocationRow extends StatelessWidget {
  final Location location;

  LocationRow(this.location);

  @override
  Widget build(BuildContext context) {
    final locationCard = new Container(
      decoration: new BoxDecoration(
        color: Color(0xFF4E4E4E),
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
              color: const Color(0xFF878787),
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

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new TextButton(
        onPressed: () {
          //Navigator.push(context, transitionRoute(widget));
        },
        child: new Stack(
          children: <Widget>[
            locationCard,
          ],
        ),
      ),
    );
  }
}
