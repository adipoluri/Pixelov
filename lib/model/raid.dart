import 'package:hive/hive.dart';
import 'package:pixelov/model/location.dart';
import 'package:pixelov/model/locations.dart';

part 'raid.g.dart';

@HiveType(typeId: 4, adapterName: "RaidAdapter")
class Raid extends HiveObject {
  @HiveField(0)
  bool scavRaid;
  @HiveField(1)
  bool pmcRaid;
  @HiveField(2)
  DateTime raidDuration;
  @HiveField(3)
  String raidCat;
  @HiveField(4)
  int raidScore;

  Raid({
    this.scavRaid = false,
    this.pmcRaid = false,
    this.raidDuration,
    this.raidCat,
  });

  bool isRaidTimerDone() {
    return (DateTime.now().isAfter(this.raidDuration));
  }

  bool inRaid() {
    return (this.scavRaid || this.pmcRaid);
  }

  int hoursLeft() {
    return raidDuration.difference(DateTime.now()).inHours;
  }

  int minsLeft() {
    return raidDuration.difference(DateTime.now()).inMinutes;
  }

  void updateRaidStatus() {
    if (isRaidTimerDone()) {
      this.pmcRaid = false;
      this.scavRaid = false;
    }
  }

  void startScavRaid(String map) {
    Location location = Locations.getLocationByName(map);
    this.scavRaid = true;
    this.raidDuration = new DateTime.now().add(
        new Duration(hours: location.raidHours, minutes: location.raidMins));
    this.raidCat = map;
    this.raidScore = location.difficulty;
  }

  void startPMCRaid(String map) {
    Location location = Locations.getLocationByName(map);
    this.pmcRaid = true;
    this.raidDuration = new DateTime.now().add(
        new Duration(hours: location.raidHours, minutes: location.raidMins));
    this.raidCat = map;
  }
}
