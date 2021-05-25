class Location {
  final String id;
  final String name;
  final int raidHours;
  final int raidMins;
  final int difficulty;
  final int minLevel;
  final String description;
  final String image;

  const Location(
      {this.id,
      this.name,
      this.raidHours,
      this.raidMins,
      this.difficulty,
      this.minLevel,
      this.description,
      this.image});
}
