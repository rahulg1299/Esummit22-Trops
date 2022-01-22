import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color orange = const Color.fromRGBO(0xc6, 0x6b, 0x3d, 1);
Color grey = const Color.fromRGBO(0x8c, 0x8c, 0x8c, 1);
Color blue = const Color.fromRGBO(0x26, 0x49, 0x5c, 1);

Color backgroundColor = const Color.fromRGBO(0xe5, 0xe5, 0xdc, 1);

late double width;
late double height;

TextStyle montserrat({
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.normal,
  color = Colors.black,
  bool styleOnly = false,
  underline = false,
}) {
  if (styleOnly) {
    return GoogleFonts.montserrat();
  }
  return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: underline ? TextDecoration.underline : null);
}

TextStyle nunito({
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.normal,
  color = Colors.black,
  bool styleOnly = false,
}) {
  if (styleOnly) {
    return GoogleFonts.nunito();
  }
  return GoogleFonts.nunito(
      fontSize: fontSize, fontWeight: fontWeight, color: color);
}

double fontSize({String size = 'medium'}) {
  switch (size) {
    case 'large':
      return width / 10;
    case 'mediumLarge':
      return width / 14;
    case 'medium':
      return width / 17;
    case 'mediumSmall':
      return width / 25;
    case 'small':
      return width / 23;
    case 'extraSmall':
      return width / 30;
    case 'xxs':
      return width / 35;
    case 'xxxs':
      return width / 47;
    default:
      return width / 17;
  }
}

String date(DateTime? dates) {
  String res = dates?.day.toString() ?? 'date';
  res += ' ';
  res += month(dates?.month);
  res += dates?.year.toString() ?? 'year';
  return res;
}

String month(int? month) {
  switch (month) {
    case 1:
      return 'Jan, ';
    case 2:
      return 'Feb, ';
    case 3:
      return 'Mar, ';
    case 4:
      return 'Apr, ';
    case 5:
      return 'May, ';
    case 6:
      return 'Jun, ';
    case 7:
      return 'Jul, ';
    case 8:
      return 'Aug, ';
    case 9:
      return 'Sep, ';
    case 10:
      return 'Oct, ';
    case 11:
      return 'Nov, ';
    case 12:
      return 'Dec, ';
    default:
      return 'month';
  }
}

String capitalize(String s) {
  if (s.isEmpty) return s;
  String retval = s.split(' ').map((str) {
    str = str.substring(0, 1).toUpperCase() + str.substring(1);
    return str;
  }).join(' ');
  return retval;
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

void setHeightWidth(BuildContext context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
}
