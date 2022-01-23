import 'package:esummit_sports/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class EquipmentDetailScreen extends StatefulWidget {
  @override
  State<EquipmentDetailScreen> createState() => _EquipmentDetailScreenState();
}

class _EquipmentDetailScreenState extends State<EquipmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Container(
              width: width,
              height: height * 0.071,
              color: backgroundColor,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: width * 0.05)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          LineIcons.arrowLeft,
                          color: orange,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Container(
                      // width: width * 0.7,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: yellow.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              LineIcons.mapMarker,
                              color: orange,
                              size: 27,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 10),
                            child: Text(
                              'Deliver to Roorkee',
                              style: montserrat(
                                fontSize: fontSize(size: 'smallMedium'),
                                color: grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
