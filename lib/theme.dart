import 'package:flutter/material.dart';

const primaryColor = Color(0xffDB545A);
const secondaryColor = Color(0xffDB5485);
const secondaryColor2 = Color(0xffD9d9d9);
const primaryTextColor = Colors.white;
const secondaTextColor = Color(0xffDB545A);

MaterialColor getMaterialcolor(int color) {
  return MaterialColor(
    color,
    <int, Color>{
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color),
    },
  );
}
