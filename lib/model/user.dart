import 'package:hive/hive.dart';
import 'package:pixelov/model/raidTimer.dart';
import 'package:pixelov/model/inventory.dart';
import 'package:pixelov/model/wallet.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';

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
  @HiveField(8)
  Wallet wallet;

  User(
      {this.lastOnlineTimestamp,
      this.email = '',
      this.userID = '',
      this.active = false,
      this.daily,
      this.raidTimers,
      this.inventory,
      this.wallet});

  void updateUser() {
    //Update DailyReward
    if (this.daily.lastRewardTimestamp.day != DateTime.now().day) {
      this.daily.collectedToday = false;
    }
  }

  void addItem(String uid, int category) {
    this.inventory.addItem(uid, category);
  }

  void removeItem(String uid, int category) {
    this.inventory.removeItem(uid, category);
  }

  void addRandomItem() {
    this.inventory.getRandomItem();
  }
}
