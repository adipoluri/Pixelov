import 'package:flutter/material.dart ';

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
                  modeButton('Raid', width),
                  modeButton('Inventory', width),
                  modeButton('Market', width),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector modeButton(String title, double width) {
    return GestureDetector(
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
