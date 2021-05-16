import 'package:hive/hive.dart';

part 'experience.g.dart';

@HiveType(typeId: 3, adapterName: "ExperienceAdapter")
class Experience extends HiveObject {
  @HiveField(0)
  int level;
  @HiveField(1)
  int experience;
  @HiveField(2)
  int expModifier;
  @HiveField(3)
  int expCap;

  Experience({
    this.level,
    this.experience,
    this.expModifier,
    this.expCap,
  });

  int getLevel() {
    return this.level;
  }

  int getExperience() {
    return this.level;
  }

  void addExperience(int exp) {
    this.experience += exp * this.expModifier;
    if (this.experience >= expCap) {
      this.experience = this.experience - expCap;
      levelUp();
    }
  }

  void increaseModifier(int mod) {
    this.expModifier = mod;
  }

  void levelUp() {
    this.level++;
    this.expCap = this.expCap * 3;
  }
}
