import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/model/category.dart';
import 'package:pixelov/model/experience.dart';
import 'package:pixelov/model/raid.dart';
import 'package:pixelov/model/time.dart';
import 'package:pixelov/model/item.dart';
import 'package:pixelov/model/user.dart';
import 'package:pixelov/model/inventory.dart';
import 'package:pixelov/model/inventorySlot.dart';
import 'package:pixelov/model/wallet.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';

class DBHandler {
  User currentUser;
  static Map<int, Category> items;

  initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter()); //1
    Hive.registerAdapter(DailyAdapter()); //2
    Hive.registerAdapter(ExperienceAdapter()); //3
    Hive.registerAdapter(RaidAdapter()); //4
    Hive.registerAdapter(TimeAdapter()); //5
    Hive.registerAdapter(InventoryAdapter()); //6
    Hive.registerAdapter(InventorySlotAdapter()); //7
    Hive.registerAdapter(WalletAdapter()); //8
  }

  initData() async {
    String data = await rootBundle.loadString('assets/data/items.json');
    Iterable list = json.decode(data);
    items = {};
    for (Map<String, dynamic> item in list) {
      items[item['id'] as int] = Category.fromJson(item);
    }
  }


  createNewUser(String playerName, String uid)  {
    User user = User(
      lastOnlineTimestamp: DateTime.now(),
      playerName: playerName,
      userID: uid,
      active: true,
      daily: new DailyReward(lastRewardTimestamp: defaultTime()),
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
      wallet: new Wallet(roubles: 0, bitcoin: 0),
      raid: new Raid(
          scavRaid: false,
          pmcRaid: false,
          raidDuration: defaultTime(),
          raidCat: "N/A"),
      experience:
          new Experience(level: 1, experience: 0, expModifier: 1, expCap: 150),
    );
    return(user);

  }

  putUserinDB(User user) async {
    final box = await Hive.openBox<User>('currentUser');
    await box.put("currentUser", user);
    currentUser = user;
  }

  saveUser() async {
    this.currentUser.save();
    //FireStoreUtils.updateCurrentUser(currentUser);
  }

  Future<User> getUser() async {
    final box = await Hive.openBox<User>('currentUser');
    return box.get("currentUser");
  }

  getCurrentUser() async {
    final box = await Hive.openBox<User>('currentUser');

    if(box == null) return false;

    currentUser = box.get("currentUser");
    currentUser.updateUser();
    convertInventory();

    return true;
  }

  clearDb() async {
    final box = await Hive.openBox<User>('currentUser');
    box.delete("currentUser");
  }

  void convertInventory() {
    //TODO: Fix this when hive gets patched

    List<InventorySlot> temp = [];
    temp.addAll(currentUser.inventory.key);
    currentUser.inventory.key = [];
    currentUser.inventory.key.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.gear);
    currentUser.inventory.gear = [];
    currentUser.inventory.gear.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.weapon);
    currentUser.inventory.weapon = [];
    currentUser.inventory.weapon.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.food);
    currentUser.inventory.food = [];
    currentUser.inventory.food.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.extra);
    currentUser.inventory.extra = [];
    currentUser.inventory.extra.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.unlockable);
    currentUser.inventory.unlockable = [];
    currentUser.inventory.unlockable.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.junk);
    currentUser.inventory.junk = [];
    currentUser.inventory.junk.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.currency);
    currentUser.inventory.currency = [];
    currentUser.inventory.currency.addAll(temp);
    temp.clear();

    temp.addAll(currentUser.inventory.valuables);
    currentUser.inventory.valuables = [];
    currentUser.inventory.valuables.addAll(temp);
  }

  Item getItemObjectWithUid(String uid, int category) {
    return items[category].items[uid];
  }
}

