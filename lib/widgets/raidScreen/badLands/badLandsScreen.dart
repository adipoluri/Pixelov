import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BadLandsScreen extends StatefulWidget {
  @override
  _BadLandsScreenState createState() => _BadLandsScreenState();
}

class _BadLandsScreenState extends State<BadLandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/raid.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Image(
                image: new AssetImage("assets/images/player/1.png"),
                height: 200,
                width: 200,
                fit: BoxFit.none,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
