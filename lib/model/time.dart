import 'package:hive/hive.dart';

part 'time.g.dart';

@HiveType(typeId: 3, adapterName: "TimeAdapter")
class Time extends HiveObject {
  @HiveField(0)
  int month;
  @HiveField(1)
  int day;
  @HiveField(2)
  int year;

  Time(int month, int day, int year) {
    this.month = month;
    this.day = day;
    this.year = year;
  }

  Time getTimeNow() {
    return new Time(
        DateTime.now().month, DateTime.now().day, DateTime.now().year);
  }
}
