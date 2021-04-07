import 'package:hive/hive.dart';

part 'time.g.dart';

@HiveType(typeId: 5, adapterName: "TimeAdapter")
class Time extends HiveObject {
  @HiveField(0)
  int mins;
  @HiveField(1)
  int hours;
  @HiveField(2)
  int days;

  Time({
    this.mins,
    this.hours,
    this.days,
  });
}
