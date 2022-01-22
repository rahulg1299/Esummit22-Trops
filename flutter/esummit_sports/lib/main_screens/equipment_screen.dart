import 'dart:ui';
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

  @override
  void initState() {
    pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                    fontSize: fontSize(size: 'mediumSmall'),
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
                      Icon(
                        LineIcons.filter,
                        size: 30,
                        color: grey,
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: width,
                  height: width * 0.5,
                  child: PageView(
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
                              image: AssetImage('assets/images/coaching.png'),
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
                              image: AssetImage('assets/images/equipment.png'),
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
                              image: AssetImage('assets/images/location.png'),
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
                              image: AssetImage('assets/images/community.png'),
                            ),
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                      ),
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
                        onTap: () {},
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
                  height: width * 0.5,
                  color: Colors.red,
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
                        onTap: () {},
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
                  height: width * 0.5,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
