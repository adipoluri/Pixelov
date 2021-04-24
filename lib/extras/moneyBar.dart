import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoneyBar extends StatelessWidget {
  final int roubles;
  final int bitcoin;

  MoneyBar(this.roubles, this.bitcoin);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: new AssetImage(
                        "assets/images/itemImages/a4798887-1f41-4634-8ca4-d5def1597607.png"),
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  roubles.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: new AssetImage(
                        "assets/images/itemImages/5ac84494-465a-424a-b36e-fe22869ba5ec.png"),
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  bitcoin.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
