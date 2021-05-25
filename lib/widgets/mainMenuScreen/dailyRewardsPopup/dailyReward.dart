import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:hive/hive.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/main.dart';

part 'dailyReward.g.dart';

@HiveType(typeId: 2, adapterName: "DailyAdapter")
class DailyReward extends HiveObject {
  @HiveField(0)
  DateTime lastRewardTimestamp;
  @HiveField(1)
  bool collectedToday;

  DailyReward({
    this.collectedToday = false,
    this.lastRewardTimestamp,
  });

  void setTimeStamp() {
    this.lastRewardTimestamp = DateTime.now();
  }

  bool canCollect() {
    return !collectedToday && lastRewardTimestamp.day != DateTime.now().day;
  }

  void collect() {
    this.collectedToday = true;
    setTimeStamp();
    MyAppState.dBhandler.updateUser(MyAppState.dBhandler.currentUser);
  }

  void debugResetDaily() {
    this.collectedToday = false;
    this.lastRewardTimestamp = DateTime.now();
  }
}

class DailyRewardWidget extends StatefulWidget {
  @override
  _DailyRewardWidgetState createState() => _DailyRewardWidgetState();
}

class _DailyRewardWidgetState extends State<DailyRewardWidget> {
  bool _isReady;
  int _timeLeft = 0;

  @override
  Widget build(BuildContext context) {
    if (_isReady) {
      return dailyRewardsReady(context);
    } else {
      return dailyRewardsNotReady(context);
    }
  }

  void isDailyRewardReady() {
    if (MyAppState.dBhandler.currentUser.daily.canCollect()) {
      setState(() {
        _isReady = true;
        _timeLeft = 0;
      });
    } else {
      setState(() {
        _isReady = false;
        _timeLeft = 24 - DateTime.now().toLocal().hour;
      });
    }
  }

  @override
  void initState() {
    isDailyRewardReady();
    super.initState();
  }

  Dialog dailyRewardsReady(BuildContext context) {
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
                Text("Redeem your Daily Gift!",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      fontFamily: 'Minecraft',
                      color: Color(0xFFE9E8D3),
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center),
                GlowIcon(
                  Icons.redeem,
                  color: Colors.yellow,
                  size: 120,
                  blurRadius: 30,
                ),
                redeemButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Dialog dailyRewardsNotReady(BuildContext context) {
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
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Come Back Tomorrow!",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Color(0xFFE9E8D3),
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.timelapse,
                  color: Colors.black,
                  size: 120,
                ),
                Text(
                  "$_timeLeft hours left!",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Color(0xFFE9E8D3),
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton redeemButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        MyAppState.dBhandler.currentUser.daily.collect();
        isDailyRewardReady();
        String uid = MyAppState.dBhandler.currentUser.addRandomItem();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return dailyRewardReady(context, uid);
          },
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF474747), // background
        onPrimary: Color(0xFFE9E9E9), // foreground
      ),
      child: Container(
        width: 200,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlowText(
                "Redeem",
                blurRadius: 50,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Color(0xFFE9E8D3),
                  fontSize: 45,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Dialog dailyRewardReady(BuildContext context, String uid) {
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
                  "You got this Item!",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    fontFamily: 'Minecraft',
                    color: Color(0xFFE9E8D3),
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Image(
                  image: new AssetImage(
                      "assets/images/itemImages/" + uid + ".png"),
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
