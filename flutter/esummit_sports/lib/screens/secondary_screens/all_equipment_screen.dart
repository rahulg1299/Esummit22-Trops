import 'dart:ui';
import 'package:esummit_sports/data_models/equipment_model.dart';
import 'package:esummit_sports/screens/secondary_screens/filter_screen.dart';
import 'package:esummit_sports/visual_components/product_tile.dart';
import 'package:esummit_sports/visual_components/small_tile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '/universal_variables.dart';

class AllEquipmentsScreen extends StatefulWidget {
  @override
  State<AllEquipmentsScreen> createState() => _AllEquipmentsScreenState();
}

class _AllEquipmentsScreenState extends State<AllEquipmentsScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EquipmentModel dummy = EquipmentModel(
      id: 1,
      name: 'Ball',
      cost: 150,
      address: 'roorkee',
      coverImg: 'https://pngimg.com/uploads/cricket/cricket_PNG85.png',
      description: 'big balll',
      toBuy: true,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Container(
              color: backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              width: width,
              height: height * 0.071,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.5,
                        height: height * 0.05,
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.all(2)),
                            Icon(
                              LineIcons.mapMarker,
                              color: orange,
                              size: 27,
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Text(
                              'Roorkee',
                              style: montserrat(
                                fontSize: fontSize(size: 'smallMedium'),
                                color: grey,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '.trops',
                          style: nunito(
                            fontSize: fontSize(
                              size: 'large',
                            ),
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(0x26, 0x49, 0x5c, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.75,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(2)),
                        Icon(
                          LineIcons.search,
                          color: orange,
                          size: 27,
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Text(
                          'Cricket',
                          style: montserrat(
                            fontSize: fontSize(size: 'extraSmall'),
                            color: grey,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilterPopUp(),
                        ),
                      );
                    },
                    child: Icon(
                      LineIcons.filter,
                      size: 30,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: width,
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 10),
              child: Text(
                'Search Results',
                style: montserrat(
                  fontSize: fontSize(
                    size: 'small',
                  ),
                  fontWeight: FontWeight.w500,
                  color: blue,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: width,
                child: ScrollConfiguration(
                  behavior: MyScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        for (int i = 0; i < 10; i++)
                          productTile(
                              data: dummy, network: false, isSmall: true),
                        Container(
                          width: width,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
