import 'dart:ui';
import 'package:esummit_sports/screens/main_screens/equipment_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '/universal_variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;

  bool isScrolled = false;

  void isScrolledFun() {
    if (scrollController.offset >= 50) {
      setState(() {
        isScrolled = true;
      });
    } else {
      setState(() {
        isScrolled = false;
      });
    }
  }

  late OverlayEntry _overlayEntry;

  void pushOverlay(Widget child) {
    _overlayEntry = createOverlay(child);
    Overlay.of(context)?.insert(_overlayEntry);
  }

  void popOverlay() {
    _overlayEntry.remove();
  }

  OverlayEntry createOverlay(Widget child) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
              onTap: popOverlay,
              child: Container(
                height: height,
                width: width,
                color: Colors.transparent,
              )),
          child,
        ],
      ),
    );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(isScrolledFun);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  padding: const EdgeInsets.only(top: 10),
                  child: ScrollConfiguration(
                    behavior: MyScrollBehavior(),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(height * 0.1)),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EquipmentScreen(),
                              ),
                            ),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.035,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Equipments',
                                    textScaleFactor: 1,
                                    style: montserrat(
                                      color: Colors.grey[800],
                                      fontSize: fontSize(size: 'extraSmall'),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                              // alignment: Alignment.bottomRight,
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: width * 0.25,
                                      height: height * 0.035,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Equipments',
                                        textScaleFactor: 1,
                                        style: montserrat(
                                          color: Colors.grey[800],
                                          fontSize:
                                              fontSize(size: 'extraSmall'),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      width: width * 0.9,
                                      height: width * 0.12,
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Equipments',
                                          textScaleFactor: 1,
                                          style: montserrat(
                                            // color: Colors.grey[800],
                                            color: backgroundColor,
                                            fontSize:
                                                fontSize(size: 'extraSmall'),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),*/
                          const Padding(padding: EdgeInsets.all(8)),
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.035,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Location',
                                    textScaleFactor: 1,
                                    style: montserrat(
                                      color: Colors.grey[800],
                                      fontSize: fontSize(size: 'extraSmall'),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(8)),
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.035,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Coaching',
                                    textScaleFactor: 1,
                                    style: montserrat(
                                      color: Colors.grey[800],
                                      fontSize: fontSize(size: 'extraSmall'),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(8)),
                          GestureDetector(
                            onTap: () => print('tapped'),
                            child: Container(
                              width: width * 0.9,
                              height: width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: width * 0.25,
                                  height: height * 0.035,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Community',
                                    textScaleFactor: 1,
                                    style: montserrat(
                                      color: Colors.grey[800],
                                      fontSize: fontSize(size: 'extraSmall'),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                        ],
                      ),
                    ),
                  ), // body
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: Container(
                    color: backgroundColor,
                    width: width,
                    height: height * 0.071,
                  ),
                ),
                //),
                Positioned(
                  top: 40,
                  left: 0,
                  child: AnimatedCrossFade(
                    layoutBuilder:
                        (topChild, topChildKey, bottomChild, bottomChildKey) {
                      return Stack(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: bottomChild,
                            key: bottomChildKey,
                            top: 0,
                          ),
                          Positioned(
                            child: topChild,
                            key: topChildKey,
                          ),
                        ],
                      );
                    },
                    crossFadeState: !isScrolled
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500),
                    firstChild: Container(
                      color: backgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      width: width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                // padding:
                                // const EdgeInsets.symmetric(horizontal: 10),
                                onTap: ,
                                child: const Icon(
                                  LineIcons.listUl,
                                  size: 30,
                                ),
                              ),
                              Container(
                                // padding:
                                // const EdgeInsets.symmetric(horizontal: 10),
                                child: const Icon(
                                  LineIcons.bell,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // padding: const EdgeInsets.symmetric(
                                  // horizontal: 10),
                                  child: Text(
                                    '.trops',
                                    style: nunito(
                                      fontSize: fontSize(
                                        size: 'large',
                                      ),
                                      fontWeight: FontWeight.w900,
                                      color: blue,
                                    ),
                                  ),
                                ), // title
                                Container(
                                  // padding: const EdgeInsets.symmetric(
                                  // horizontal: 10),
                                  child: Text(
                                    'Know Your Sport',
                                    style: montserrat(
                                      fontSize: fontSize(
                                        size: 'small',
                                      ),
                                      fontWeight: FontWeight.w500,
                                      color: orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondChild: Container(
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
                                // padding:
                                // const EdgeInsets.symmetric(horizontal: 10),
                                child: const Icon(
                                  LineIcons.listUl,
                                  size: 30,
                                ),
                              ),
                              Container(
                                // padding:
                                // const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '.trops',
                                  style: nunito(
                                    fontSize: fontSize(
                                      size: 'large',
                                    ),
                                    fontWeight: FontWeight.w800,
                                    color: const Color.fromRGBO(
                                        0x26, 0x49, 0x5c, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
