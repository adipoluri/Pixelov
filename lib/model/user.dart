import 'package:hive/hive.dart';
import 'package:pixelov/model/inventorySlot.dart';
import 'package:pixelov/model/raidTimer.dart';
import 'package:pixelov/model/inventory.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';
import 'package:pixelov/extras/constants.dart';

part 'user.g.dart';

@HiveType(typeId: 1, adapterName: "UserAdapter")
class User extends HiveObject {
  @HiveField(0)
  DateTime lastOnlineTimestamp;
  @HiveField(1)
  String email;
  @HiveField(2)
  String userID;
  @HiveField(4)
  bool active;
  @HiveField(5)
  DailyReward daily;
  @HiveField(6)
  RaidTimer raidTimers;
  @HiveField(7)
  Inventory inventory;

  User({
    this.lastOnlineTimestamp,
    this.email = '',
    this.userID = '',
    this.active = false,
    this.daily,
    this.raidTimers,
    this.inventory,
  });

  void updateUser() {
    //Update DailyReward
    if (this.daily.lastRewardTimestamp.day != DateTime.now().day) {
      this.daily.collectedToday = false;
    }
  }

  void addItem(String uid, int category) {
    switch (category) {
      case CategoryTypes.KEY:
        for (int i = 0; i < inventory.key.length; i++) {
          if (inventory.key[i].uid == uid) {
            inventory.key[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.GEAR:
        for (int i = 0; i < inventory.gear.length; i++) {
          if (inventory.gear[i].uid == uid) {
            inventory.gear[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.WEAPON:
        for (int i = 0; i < inventory.weapon.length; i++) {
          if (inventory.weapon[i].uid == uid) {
            inventory.weapon[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.EXTRA:
        for (int i = 0; i < inventory.extra.length; i++) {
          if (inventory.extra[i].uid == uid) {
            inventory.extra[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.UNLOCKABLE:
        for (int i = 0; i < inventory.unlockable.length; i++) {
          if (inventory.unlockable[i].uid == uid) {
            inventory.unlockable[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.JUNK:
        for (int i = 0; i < inventory.junk.length; i++) {
          if (inventory.junk[i].uid == uid) {
            inventory.junk[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.CURRENCY:
        for (int i = 0; i < inventory.currency.length; i++) {
          if (inventory.currency[i].uid == uid) {
            inventory.currency[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.VALUABLES:
        for (int i = 0; i < inventory.valuables.length; i++) {
          if (inventory.valuables[i].uid == uid) {
            inventory.valuables[i].total++;
            break;
          }
        }
        inventory.key.add(new InventorySlot(uid: uid, total: 1));
        break;
    }
  }
}
