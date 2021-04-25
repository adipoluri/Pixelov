import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/model/item.dart';

const List<int> badLandsLootPool = [
  1,
  2,
  2,
  2,
  3,
  3,
  3,
  4,
  4,
  4,
  4,
  4,
  5,
  5,
  5,
  7,
  7,
  7,
  7,
  7,
  7,
  9
];

void badLandsReward(int count, BuildContext context) {
  int rate = count % 100;
  if (rate == 0) rate = 100;
  var random = new Random();

  if (random.nextInt(100) <= rate) {
    int randomNumber = badLandsLootPool[random.nextInt(22)];
    int randomItemIndex =
        random.nextInt(DBHandler.items[randomNumber].items.length - 1);
    int counter = 0;

    for (Item item in DBHandler.items[randomNumber].items.values) {
      if (counter == randomItemIndex) {
        MyAppState.dBhandler.currentUser.addItem(item.uid, item.category);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return itemRewardReady(context, item.uid);
          },
        );
        break;
      }
      counter++;
    }
  }
}

Dialog itemRewardReady(BuildContext context, String uid) {
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
                "You Found an Item!",
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
                image:
                    new AssetImage("assets/images/itemImages/" + uid + ".png"),
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
