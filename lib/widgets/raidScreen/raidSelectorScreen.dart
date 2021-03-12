import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RaidSelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = (MediaQuery.of(context).size.height / 3) - 180;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/raid.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
              Wrap(
                runSpacing: 8,
                children: [
                  raidButton(
                    context,
                    "Scav Run",
                    width,
                    height,
                    'assets/images/scavbutton.png',
                  ),
                  raidButton(
                    context,
                    "PMC Run",
                    width,
                    height,
                    'assets/images/raidbutton.png',
                  ),
                  raidButton(context, "Bad Lands", width, height,
                      'assets/images/badlandsbutton.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton raidButton(BuildContext context, String title, double width,
      double height, String path) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.push(context, transitionRoute(widget));
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0x1AFFFFFF), // background
        onPrimary: Color(0xFFFFFFFF), // foreground
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
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
          ],
        ),
      ),
    );
  }
}
