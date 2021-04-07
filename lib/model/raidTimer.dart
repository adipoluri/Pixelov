import 'package:hive/hive.dart';
import 'package:pixelov/model/time.dart';

part 'raidTimer.g.dart';

@HiveType(typeId: 4, adapterName: "RaidTimerAdapter")
class RaidTimer extends HiveObject {
  @HiveField(0)
  DateTime scavTimer;
  @HiveField(1)
  bool scavRaid;
  @HiveField(2)
  DateTime pmcTimer;
  @HiveField(3)
  bool pmcRaid;
  @HiveField(4)
  Time raidDuration;

  RaidTimer({
    this.scavTimer,
    this.scavRaid = false,
    this.pmcTimer,
    this.pmcRaid = false,
    this.raidDuration,
  });

  bool isRaidTimerDone() {
    return (DateTime.now().isAfter(this.scavTimer) ||
        DateTime.now().isAfter(this.scavTimer));
  }

  bool inRaid() {
    return (this.scavRaid || this.pmcRaid);
  }

  int hoursLeft() {
    if (scavRaid) {
      return scavTimer.difference(DateTime.now()).inHours;
    } else {
      return pmcTimer.difference(DateTime.now()).inHours;
    }
  }

  int minsLeft() {
    if (scavRaid) {
      return scavTimer.difference(DateTime.now()).inMinutes;
    } else {
      return pmcTimer.difference(DateTime.now()).inMinutes;
    }
  }

  void updateRaidStatus() {
    if (isRaidTimerDone()) {
      this.pmcRaid = false;
      this.scavRaid = false;
    }
  }
}
