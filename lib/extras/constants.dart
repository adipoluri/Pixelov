import 'package:flutter/material.dart';

const COLOR_PRIMARY = 0xFF4E4E4E;

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
