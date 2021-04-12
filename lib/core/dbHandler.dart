import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/model/category.dart';
import 'package:pixelov/model/raidTimer.dart';
import 'package:pixelov/model/time.dart';
import 'package:pixelov/model/user.dart';
import 'package:pixelov/model/inventory.dart';
import 'package:pixelov/model/inventorySlot.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';

class DBHandler {
  User currentUser;
  static Map<int, Category> items;

  initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(RaidTimerAdapter());
    Hive.registerAdapter(DailyAdapter());
    Hive.registerAdapter(TimeAdapter());
    Hive.registerAdapter(InventoryAdapter());
    Hive.registerAdapter(InventorySlotAdapter());
  }

  initData() async {
    String data = await rootBundle.loadString('assets/data/items.json');
    Iterable list = json.decode(data);
    items = {};
    for (Map<String, dynamic> item in list) {
      items[item['id'] as int] = Category.fromJson(item);
    }
  }

  Future<User> createAndUpdateUser(String email, String uid) async {
    User user = User(
      lastOnlineTimestamp: DateTime.now(),
      email: email,
      userID: uid,
      active: true,
      daily: new DailyReward(lastRewardTimestamp: defaultTime()),
      raidTimers: new RaidTimer(
        scavTimer: defaultTime(),
        pmcTimer: defaultTime(),
      ),
      inventory: new Inventory(
        key: <InventorySlot>[],
        gear: <InventorySlot>[],
        weapon: <InventorySlot>[],
        food: <InventorySlot>[],
        extra: <InventorySlot>[],
        unlockable: <InventorySlot>[],
        junk: <InventorySlot>[],
        currency: <InventorySlot>[],
        valuables: <InventorySlot>[],
      ),
    );

    final box = await Hive.openBox<User>('currentUser');
    await box.put("currentUser", user);
    currentUser = user;
    return user;
  }

  updateUser(User user) async {
    final box = await Hive.openBox<User>('currentUser');
    await box.put("currentUser", user);
    currentUser = user;
  }

  updateCurrentUser() async {
    this.currentUser.save();
    //FireStoreUtils.updateCurrentUser(currentUser);
  }

  Future<User> getUser() async {
    final box = await Hive.openBox<User>('currentUser');
    return box.get("currentUser");
  }

  setCurrentUser() async {
    final box = await Hive.openBox<User>('currentUser');
    currentUser = box.get("currentUser");
    currentUser.updateUser();
  }

  clearDb() async {
    final box = await Hive.openBox<User>('currentUser');
    box.delete("currentUser");
  }
}

class FireStoreUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();
}
