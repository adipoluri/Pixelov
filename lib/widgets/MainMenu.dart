import 'package:flutter/material.dart ';
import 'package:pixelov/widgets/raidScreen/raidSelectorScreen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 120;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/title.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Wrap(
                runSpacing: 16,
                children: [
                  dirButton(context, 'Raid', width, RaidSelectorScreen()),
                  dirButton(context, 'Inventory', width, RaidSelectorScreen()),
                  dirButton(context, 'Market', width, RaidSelectorScreen()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton dirButton(
      BuildContext context, String title, double width, Widget widget) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, transitionRoute(widget));
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0x1AFFFFFF), // background
        onPrimary: Color(0xFFFFFFFF), // foreground
      ),
      child: Container(
        width: width,
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

  Route transitionRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
