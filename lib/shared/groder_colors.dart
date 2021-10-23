import 'package:flutter/material.dart';

Map<int, Color> coloring = {
  50: Color(0xff2ecc71),
  100: Color(0xff2ecc71),
  200: Color(0xff2ecc71),
  300: Color(0xff2ecc71),
  400: Color(0xff2ecc71),
  500: Color(0xff2ecc71),
  600: Color(0xff2ecc71),
  700: Color(0xff2ecc71),
  800: Color(0xff2ecc71),
  900: Color(0xff2ecc71),
};

class GroderColors {
  static final Color black = const Color(0xff0B0B0B);
  static final Color grey = const Color(0xffBCB8B8);
  static final Color darkGrey = const Color(0xff565656);
  static final Color green = const Color(0xff2ecc71);
  static final Color blue = const Color(0xff3d9cdb);
  static final Color lightGreen = const Color(0xffD9FDEE);
  static final Color white = const Color(0xffFFFFFF);

  static final MaterialColor greenMaterial =
      MaterialColor(0xff0B0B0B, coloring);
}
