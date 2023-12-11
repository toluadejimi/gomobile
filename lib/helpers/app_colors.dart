import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFFC700);
const Color green = Color(0xFF07F683);
const Color red = Color(0xFFFF0000);
const Color black = Color(0xFF000000);
const Color grey = Color(0xFF1E1E1E);
const Color grey15 = Color(0x26727226);
const Color shadeOfYellow = Color(0xFFE8B500);
const Color dividerGrey = Color(0x26727226);
const Color textGrey = Color(0xFF727272);
const Color transaparentGrey = Color(0x21727272);
const Color transparentWhite = Color(0x96FFFFFF);
const Color veryTransparentWhite = Color(0x4DFFFFFF);
const Color offWhite = Color.fromARGB(255, 235, 244, 230);
const Color white36 = Color(0x5CFFFFFF);
const Color blue = Color(0xFF1982FC);

const Color white = Color.fromARGB(255, 255, 255, 255);
final Map<int, Color> _yellow700Map = {
  50: primaryColor,
};

final MaterialColor splashScreenBackground =
    MaterialColor(Colors.yellow[50]!.value, _yellow700Map);

// const MaterialColor slashScreenBackground =
// const Gradient gradient = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [
//     primaryColor,
//     accentColor,
//   ],
// );

const kAnimationDuration = Duration(milliseconds: 200);
