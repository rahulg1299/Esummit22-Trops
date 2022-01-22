// import 'package:doctodo/api_handling/api_data_fetch/data_models/appbar_data_model.dart';
// import 'package:doctodo/api_handling/api_data_fetch/fetch_fuctions/fetch_appbar_data.dart';
import '/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:lottie/lottie.dart';

class ScrollableAppBar extends StatefulWidget {
  final ScrollController controller;
  // final String? logo;
  final String userName;
  // final String? clinicID;

  ScrollableAppBar(this.controller, this.userName);

  @override
  _ScrollableAppBarState createState() => _ScrollableAppBarState();
}

class _ScrollableAppBarState extends State<ScrollableAppBar> {
  bool isScrolled = false;
  // Future<AppbarData>? appbar;

  void isScrolledFun() {
    if (widget.controller.offset >= height / 10) {
      setState(() {
        isScrolled = true;
      });
    } else {
      setState(() {
        isScrolled = false;
      });
    }
  }

  @override
  void initState() {
    widget.controller.addListener(isScrolledFun);
    // appbar = fetchAppbarData(widget.clinicID ?? ' ');
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(isScrolledFun);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    DateTime today = DateTime.now();
    return SliverAppBar(
      expandedHeight: height / 3.1,
      floating: false,
      pinned: true,
      leading: null,
      backgroundColor: orange,
      elevation: 10,
      shadowColor: Colors.grey.withOpacity(0.25),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: (isScrolled)
                  ? Radius.circular(height / 40)
                  : Radius.circular(height / 30))),
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isScrolled ? 1.0 : 0.0,
        curve: Curves.ease,
        child: Text(
          'Upcoming Appointments',
          style: montserrat(
              fontSize: fontSize(
                size: 'small',
              ),
              color: Colors.white),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isScrolled ? 0.0 : 1.0,
          child: Container(
            padding: EdgeInsets.only(
                top: height / 20,
                left: width / 30,
                right: width / 30,
                bottom: height / 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: width / 6,
                      width: width / 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date(today),
                            style: montserrat(
                              fontSize: fontSize(size: 'extraSmall'),
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            capitalize(widget.userName),
                            style: montserrat(
                              fontSize: fontSize(size: 'medium'),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: height / 80)),
                /*FutureBuilder(
                  future: appbar,
                  builder: (BuildContext context,
                      AsyncSnapshot<AppbarData> snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeScreenInfoTile(
                                context,
                                loading: true,
                                subtitle: 'Upcoming Appts',
                                icon: LineIcons.clock,
                              ),
                              homeScreenInfoTile(
                                context,
                                primary: Colors.green,
                                loading: true,
                                subtitle: 'Total Appts',
                                icon: LineIcons.calendarCheck,
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: height / 60)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeScreenInfoTile(
                                context,
                                primary: Colors.blue,
                                loading: true,
                                subtitle: 'Appts This Month',
                                icon: LineIcons.calendarCheck,
                              ),
                              homeScreenInfoTile(
                                context,
                                primary: Colors.purple,
                                loading: true,
                                subtitle: 'Overall Income',
                                icon: LineIcons.indianRupeeSign,
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.hasData) {
                      AppbarData appbarData = snapshot.data!;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeScreenInfoTile(
                                context,
                                subtitle: 'Upcoming Appts',
                                icon: LineIcons.clock,
                                title:
                                    appbarData.upcomingAppointments.toString(),
                              ),
                              homeScreenInfoTile(
                                context,
                                primary: Colors.green,
                                subtitle: 'Total Appts',
                                icon: LineIcons.calendarCheck,
                                title: appbarData.totalAppointments.toString(),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: height / 60)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeScreenInfoTile(
                                context,
                                primary: Colors.blue,
                                subtitle: 'Appts This Month',
                                icon: LineIcons.calendarCheck,
                                title: appbarData.monthAppointments.toString(),
                              ),
                              homeScreenInfoTile(
                                context,
                                primary: Colors.purple,
                                subtitle: 'Overall Income',
                                icon: LineIcons.indianRupeeSign,
                                title:
                                    '₹ ' + appbarData.overallIncome.toString(),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeScreenInfoTile(
                                context,
                                error: true,
                                subtitle: 'Upcoming Appts',
                                icon: LineIcons.clock,
                              ),
                              homeScreenInfoTile(
                                context,
                                primary: Colors.green,
                                error: true,
                                subtitle: 'Total Appts',
                                icon: LineIcons.calendarCheck,
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: height / 60)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeScreenInfoTile(
                                context,
                                primary: Colors.blue,
                                error: true,
                                subtitle: 'Appts This Month',
                                icon: LineIcons.calendarCheck,
                              ),
                              homeScreenInfoTile(
                                context,
                                primary: Colors.purple,
                                error: true,
                                subtitle: 'Overall Income',
                                icon: LineIcons.indianRupeeSign,
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget homeScreenInfoTile(
  BuildContext context, {
  MaterialColor primary = Colors.yellow,
  String title = 'XXXX',
  String subtitle = 'Temp Subtitle',
  IconData? icon,
  bool loading = false,
  bool error = false,
}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    width: width / 2.25,
    height: height / 13,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          offset: const Offset(2, 2),
          blurRadius: 1,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: width / 6,
          height: height / 13,
          decoration: BoxDecoration(
            color: primary[100],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Icon(
              icon ?? LineIcons.home,
              color: primary[700],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(4)),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (!loading)
                      ? Text(
                          (error) ? '0' : title,
                          style: montserrat(
                              fontSize: fontSize(size: 'small'),
                              fontWeight: FontWeight.w500),
                        )
                      : Container(
                          /*child: Lottie.asset(
                              'assets/lottie_animations/loading.json',
                              frameRate: FrameRate(60),
                              width: MediaQuery.of(context).size.height / 30,
                              height: MediaQuery.of(context).size.height / 30,),*/
                          ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    style: montserrat(
                      fontSize: fontSize(size: 'xxs'),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )),
        ),
      ],
    ),
  );
}
