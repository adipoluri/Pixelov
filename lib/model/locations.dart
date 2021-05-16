import 'location.dart';

class Locations {
  static final List<Location> locations = [
    const Location(
      id: "1",
      name: "Customs",
      raidHours: 0,
      raidMins: 30,
      difficulty: 50,
      description: "Lorem ipsum...",
      image: 'assets/images/customs.png',
    ),
    const Location(
      id: "2",
      name: "Interchange",
      raidHours: 1,
      raidMins: 0,
      difficulty: 150,
      description: "Lorem ipsum...",
      image: 'assets/images/interchange.png',
    ),
    const Location(
      id: "3",
      name: "Factory",
      raidHours: 1,
      raidMins: 30,
      difficulty: 300,
      description: "Lorem ipsum...",
      image: 'assets/images/factory.png',
    ),
    const Location(
      id: "4",
      name: "Woods",
      raidHours: 2,
      raidMins: 0,
      difficulty: 450,
      description: "Lorem ipsum...",
      image: 'assets/images/woods.png',
    ),
    const Location(
      id: "5",
      name: "Shoreline",
      raidHours: 3,
      raidMins: 0,
      difficulty: 500,
      description: "Lorem ipsum...",
      image: 'assets/images/shoreline.png',
    ),
    const Location(
      id: "6",
      name: "Reserve",
      raidHours: 6,
      raidMins: 0,
      difficulty: 600,
      description: "Lorem ipsum...",
      image: 'assets/images/reserve.png',
    ),
    const Location(
      id: "7",
      name: "Labs",
      raidHours: 12,
      raidMins: 0,
      difficulty: 1000,
      description: "Lorem ipsum...",
      image: 'assets/images/labs.png',
    ),
    const Location(
      id: "8",
      name: "Streets of Pixelov",
      raidHours: 24,
      raidMins: 0,
      difficulty: 1500,
      description: "Lorem ipsum...",
      image: 'assets/images/streets.png',
    ),
  ];

  static Location getLocationById(id) {
    return locations.where((p) => p.id == id).first;
  }

  static Location getLocationByName(name) {
    return locations.where((p) => p.name == name).first;
  }
}
