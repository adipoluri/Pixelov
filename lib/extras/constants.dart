import 'package:flutter/material.dart';

const COLOR_PRIMARY = 0xFF4E4E4E;
const String API_KEY = "maa5OwaDmLmuCx73";

DateTime defaultTime() {
  return new DateTime(2001, 12, 6);
}

class TextStyles {
  const TextStyles();

  static const TextStyle locationTitle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Minecraft',
      fontWeight: FontWeight.w600,
      fontSize: 24.0);

  static const TextStyle locationSubText = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontFamily: 'Minecraft',
      fontWeight: FontWeight.w300,
      fontSize: 18.0);

  static const TextStyle locationSubHeading = const TextStyle(
      color: Colors.white,
      fontFamily: 'Minecraft',
      fontWeight: FontWeight.w300,
      fontSize: 12.0);
}

class CategoryTypes {
  static const int KEY = 1;
  static const int GEAR = 2;
  static const int WEAPON = 3;
  static const int FOOD = 4;
  static const int EXTRA = 5;
  static const int UNLOCKABLE = 6;
  static const int JUNK = 7;
  static const int CURRENCY = 8;
  static const int VALUABLES = 9;
}
