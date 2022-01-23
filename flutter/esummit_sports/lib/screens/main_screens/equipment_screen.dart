import 'dart:ui';
import 'package:esummit_sports/data_models/equipment_model.dart';
import 'package:esummit_sports/screens/secondary_screens/all_equipment_screen.dart';
import 'package:esummit_sports/screens/secondary_screens/filter_screen.dart';
import 'package:esummit_sports/visual_components/product_tile.dart';
import 'package:esummit_sports/visual_components/small_tile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '/universal_variables.dart';

class EquipmentScreen extends StatefulWidget {
  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  late PageController pageController;

  int page = 0;

  void screenChange() {
    if (pageController.page!.toInt() == pageController.page) {
      setState(() {
        page = pageController.page!.toInt();
      });
      print(page);
    }
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(screenChange);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(screenChange);
    super.dispose();
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
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(20)),
                Container(
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  width: width,
                  height: height * 0.071,
                  child: Column(
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
                                color:
                                    const Color.fromRGBO(0x26, 0x49, 0x5c, 1),
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
                        onTap: () async {
                          await bottomPopUpFilter(context);
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
                  height: width * 0.5,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        children: [
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(10, 10),
                                  )
                                ],
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/coaching.png'),
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(10, 10),
                                  )
                                ],
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/equipment.png'),
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(10, 10),
                                  )
                                ],
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/location.png'),
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(10, 10),
                                  )
                                ],
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/community.png'),
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: height * 0.02 + 10,
                              width: width * 0.25,
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (page == 0)
                                          ? backgroundColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: backgroundColor, width: 2),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (page == 1)
                                          ? backgroundColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: backgroundColor, width: 2),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (page == 2)
                                          ? backgroundColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: backgroundColor, width: 2),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (page == 3)
                                          ? backgroundColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: backgroundColor, width: 2),
                                    ),
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buy',
                        style: montserrat(
                          fontSize: fontSize(
                            size: 'medium',
                          ),
                          fontWeight: FontWeight.w500,
                          color: blue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllEquipmentsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: montserrat(
                            fontSize: fontSize(
                              size: 'extraSmall',
                            ),
                            fontWeight: FontWeight.w500,
                            color: orange,
                            underline: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: width * 0.7,
                  child: ScrollConfiguration(
                    behavior: MyScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.045,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: false, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: false, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rent',
                        style: montserrat(
                          fontSize: fontSize(
                            size: 'medium',
                          ),
                          fontWeight: FontWeight.w500,
                          color: blue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllEquipmentsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: montserrat(
                            fontSize: fontSize(
                              size: 'extraSmall',
                            ),
                            fontWeight: FontWeight.w500,
                            color: orange,
                            underline: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: width * 0.7,
                  child: ScrollConfiguration(
                    behavior: MyScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.045,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: false, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: false, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          productTile(context,
                              data: dummy, network: true, isSmall: false),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.045,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
