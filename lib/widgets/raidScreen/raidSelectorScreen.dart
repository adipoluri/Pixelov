import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RaidSelectorScreen extends StatelessWidget {
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
          //raidButton(),
          //raidButton(),
          //raidButton(),
        ],
      ),
    );
  }

  ElevatedButton raidButton(
      BuildContext context, String title, double width, Widget widget) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.push(context, transitionRoute(widget));
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Color(0x1AC9C9C9),
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
