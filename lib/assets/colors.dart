import 'dart:ui';
import 'package:flutter/cupertino.dart';

enum ColorName {
  basicBlue,
  primary,
  secondary,
  white,
  transparent,
  flightBlue,
  hotelDarkBlue,
  xperiencePink,
  orangeEats,
  financialDarkBlue,
  orangeTooltip,
}

const Map<ColorName, Color> colors = {
  ColorName.basicBlue: Color.fromARGB(255, 27, 160, 226),
  ColorName.primary: Color.fromARGB(255, 3, 18, 26),
  ColorName.secondary: Color.fromARGB(255, 188, 187, 186),
  ColorName.white: Color.fromARGB(255, 255, 255, 255),
  ColorName.transparent: Color.fromARGB(0, 0, 0, 0),
  ColorName.flightBlue: Color.fromARGB(255, 48, 197, 247),
  ColorName.hotelDarkBlue: Color.fromARGB(255, 35, 93, 159),
  ColorName.xperiencePink: Color.fromARGB(255, 255, 108, 106),
  ColorName.orangeEats: Color.fromARGB(255, 248, 111, 9),
  ColorName.financialDarkBlue: Color.fromARGB(255, 5, 62, 104),
  ColorName.orangeTooltip: Color.fromARGB(255, 226, 88, 36),
};