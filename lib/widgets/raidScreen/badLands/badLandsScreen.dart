import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/extras/moneyBar.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/model/item.dart';
import 'package:pixelov/logic/badlandsLogic.dart';

class BadLandsScreen extends StatefulWidget {
  @override
  _BadLandsScreenState createState() => _BadLandsScreenState();
}

class _BadLandsScreenState extends State<BadLandsScreen> {
  String playerState;
  int roubles;
  int bitcoin;
  int _clickCount;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = (MediaQuery.of(context).size.height / 4);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/badlands.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: new Image(
                      image: new AssetImage(this.playerState),
                      height: 112,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: shootButton(context, width, height),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new MoneyBar(roubles, bitcoin),
              ],
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

  ElevatedButton shootButton(
      BuildContext context, double width, double height) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          this.playerState = SHOOT_PLAYER;
          shootingCallback();
          processShoot();
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF474747), // background
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
                "Shoot",
                blurRadius: 50,
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

  @override
  void initState() {
    this.playerState = DEF_PLAYER;
    this.roubles = MyAppState.dBhandler.currentUser.wallet.roubles;
    this.bitcoin = MyAppState.dBhandler.currentUser.wallet.bitcoin;
    _clickCount = 0;
    super.initState();
  }

  shootingCallback() async {
    await Future.delayed(Duration(milliseconds: 140));
    setState(() {
      this.playerState = DEF_PLAYER;
    });
  }

  processShoot() {
    _clickCount++;
    MyAppState.dBhandler.currentUser.wallet.roubles++;
    if (_clickCount == 500) {
      MyAppState.dBhandler.currentUser.wallet.bitcoin++;
    }
    if (_clickCount % 25 == 0) {
      badLandsReward(_clickCount, context);
    }
    setState(() {
      this.roubles = MyAppState.dBhandler.currentUser.wallet.roubles;
      this.bitcoin = MyAppState.dBhandler.currentUser.wallet.bitcoin;
    });
  }
}
