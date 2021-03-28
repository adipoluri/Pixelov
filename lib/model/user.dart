import 'package:hive/hive.dart';
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

  User({
    this.lastOnlineTimestamp,
    this.email = '',
    this.userID = '',
    this.active = false,
    this.daily,
  });
}
