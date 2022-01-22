import '/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget smallTile(
    {required String title,
    required VoidCallback onTap,
    Color? color,
    bool isBig = false}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: isBig ? height * 0.06 : height * 0.03,
      width: width * 0.2,
      // padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[400]!,
        ),
      ),
      child: Text(
        title,
        style: montserrat(
          fontSize: fontSize(size: 'xxs'),
          color: Colors.grey,
        ),
      ),
    ),
  );
}
