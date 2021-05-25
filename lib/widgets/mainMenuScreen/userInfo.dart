import 'package:flutter/material.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/main.dart';

class UserInfoWidget extends StatelessWidget {
  final String _level;

  UserInfoWidget(this._level);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_right),
              color: Colors.white,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return infoDialog(context);
                  },
                );
              },
            ),
            Text(
              _level,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                fontFamily: 'Minecraft',
                color: Color(0xFFE9E8D3),
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO: Add Leaderboard
  Dialog infoDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(COLOR_PRIMARY),
            ),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              children: [
                Text(
                  "Level ${MyAppState.dBhandler.currentUser.experience.level}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Color(0xFFE9E8D3),
                    fontSize: 36,
                  ),
                ),
                Text(
                  "Experience Points ${MyAppState.dBhandler.currentUser.experience.experience}/${MyAppState.dBhandler.currentUser.experience.expCap}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Color(0xFFE9E8D3),
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: new AssetImage(
                            "assets/images/itemImages/a4798887-1f41-4634-8ca4-d5def1597607.png"),
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      "${MyAppState.dBhandler.currentUser.wallet.roubles}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        fontFamily: 'Minecraft',
                        color: Colors.white,
                        fontSize: 30,
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
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      "${MyAppState.dBhandler.currentUser.wallet.bitcoin}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        fontFamily: 'Minecraft',
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
