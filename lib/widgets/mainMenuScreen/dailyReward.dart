import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/model/time.dart';

part 'dailyReward.g.dart';

@HiveType(typeId: 2, adapterName: "DailyAdapter")
class DailyReward {
  @HiveField(0)
  Time lastRewardTimestamp;
  @HiveField(1)
  bool collectedToday;

  DailyReward({
    this.collectedToday = false,
    lastRewardTimestamp,
  }) : this.lastRewardTimestamp = new Time(12, 6, 2001);

  void setTimeStamp() {
    DateTime time = DateTime.now();
    this.lastRewardTimestamp = new Time(time.month, time.day, time.year);
  }

  bool canCollect() {
    return !collectedToday && lastRewardTimestamp.day != DateTime.now().day;
  }

  void collect() {
    this.collectedToday = true;
    setTimeStamp();
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
    if (DBHandler.currentUser.daily.canCollect()) {
      setState(() {
        _isReady = true;
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
                borderRadius: BorderRadius.circular(15), color: Colors.yellow),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Text("Redeem your Daily Gift!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Color(0xFFE9E8D3),
                  fontSize: 40,
                ),
                textAlign: TextAlign.center),
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
                color: Color(COLOR_PRIMARY)),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Text("Redeem Daily Gift!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Color(0xFFE9E8D3),
                  fontSize: 40,
                ),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
