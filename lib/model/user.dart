import 'package:hive/hive.dart';
import 'package:pixelov/model/time.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';

part 'user.g.dart';

@HiveType(typeId: 1, adapterName: "UserAdapter")
class User {
  @HiveField(0)
  Time lastOnlineTimestamp;
  @HiveField(1)
  String email;
  @HiveField(2)
  String userID;
  @HiveField(4)
  bool active;
  @HiveField(5)
  DailyReward daily;

  User({
    lastOnlineTimestamp,
    this.email = '',
    this.userID = '',
    this.active = false,
    daily,
  })  : this.lastOnlineTimestamp = new Time(
            DateTime.now().month, DateTime.now().day, DateTime.now().year),
        this.daily = new DailyReward();
}
