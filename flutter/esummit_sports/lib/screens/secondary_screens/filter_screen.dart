import 'package:esummit_sports/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FilterPopUp extends StatefulWidget {
  @override
  State<FilterPopUp> createState() => _FilterPopUpState();
}

class _FilterPopUpState extends State<FilterPopUp> {
  int categorySelected = 0;
  List<List<String>> filtersSelected = List.filled(
    5,
    List.empty(growable: true),
  );

  bool isSelected(int category, String filter) {
    if (filtersSelected[category].contains(filter)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: height,
      color: backgroundColor,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categorySelected = 0;
                      });
                    },
                    child: Container(
                      width: width * 0.5,
                      height: height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: (categorySelected == 0) ? blueGrey : null,
                        border: BorderDirectional(
                          top: BorderSide(color: lightGrey, width: 2),
                          start: BorderSide(color: lightGrey, width: 2),
                          end: categorySelected != 0
                              ? BorderSide(color: lightGrey, width: 2)
                              : BorderSide.none,
                        ),
                      ),
                      child: Text(
                        'Sports',
                        style: montserrat(
                          fontSize: fontSize(size: 'small'),
                          color: blue,
                          fontWeight: (categorySelected == 0)
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categorySelected = 1;
                      });
                    },
                    child: Container(
                      width: width * 0.5,
                      height: height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: (categorySelected == 1) ? blueGrey : null,
                        border: BorderDirectional(
                          top: BorderSide(color: lightGrey, width: 2),
                          start: BorderSide(color: lightGrey, width: 2),
                          end: categorySelected != 1
                              ? BorderSide(color: lightGrey, width: 2)
                              : BorderSide.none,
                        ),
                      ),
                      child: Text(
                        'Equipment Type',
                        style: montserrat(
                          fontSize: fontSize(size: 'small'),
                          color: blue,
                          fontWeight: (categorySelected == 1)
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categorySelected = 2;
                      });
                    },
                    child: Container(
                      width: width * 0.5,
                      height: height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: (categorySelected == 2) ? blueGrey : null,
                        border: BorderDirectional(
                          top: BorderSide(color: lightGrey, width: 2),
                          start: BorderSide(color: lightGrey, width: 2),
                          end: categorySelected != 2
                              ? BorderSide(color: lightGrey, width: 2)
                              : BorderSide.none,
                        ),
                      ),
                      child: Text(
                        'Price',
                        style: montserrat(
                          fontSize: fontSize(size: 'small'),
                          color: blue,
                          fontWeight: (categorySelected == 2)
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categorySelected = 3;
                      });
                    },
                    child: Container(
                      width: width * 0.5,
                      height: height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: (categorySelected == 3) ? blueGrey : null,
                        border: BorderDirectional(
                          top: BorderSide(color: lightGrey, width: 2),
                          start: BorderSide(color: lightGrey, width: 2),
                          end: categorySelected != 3
                              ? BorderSide(color: lightGrey, width: 2)
                              : BorderSide.none,
                        ),
                      ),
                      child: Text(
                        'Brand',
                        style: montserrat(
                          fontSize: fontSize(size: 'small'),
                          color: blue,
                          fontWeight: (categorySelected == 3)
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categorySelected = 4;
                      });
                    },
                    child: Container(
                      width: width * 0.5,
                      height: height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: (categorySelected == 4) ? blueGrey : null,
                        border: BorderDirectional(
                          top: BorderSide(color: lightGrey, width: 2),
                          start: BorderSide(color: lightGrey, width: 2),
                          end: categorySelected != 4
                              ? BorderSide(color: lightGrey, width: 2)
                              : BorderSide.none,
                          bottom: BorderSide(color: lightGrey, width: 2),
                        ),
                      ),
                      child: Text(
                        'Gender',
                        style: montserrat(
                          fontSize: fontSize(size: 'small'),
                          color: blue,
                          fontWeight: (categorySelected == 4)
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ), //category
              Container(
                width: width * 0.5,
                height: height * 0.05 * 5,
                decoration: BoxDecoration(
                  color: blueGrey,
                  border: BorderDirectional(
                    top: BorderSide(color: lightGrey, width: 2),
                    bottom: BorderSide(color: lightGrey, width: 2),
                  ),
                ),
                child: ScrollConfiguration(
                  behavior: MyScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0;
                            i <
                                (filters[categorySelected].length < 5
                                    ? 5
                                    : filters[categorySelected].length);
                            i++)
                          GestureDetector(
                            onTap: (i >= filters[categorySelected].length)
                                ? null
                                : () {
                                    String temp = filters[categorySelected][i];

                                    if (isSelected(categorySelected, temp)) {
                                      setState(() {
                                        filtersSelected[categorySelected]
                                            .remove(temp);
                                      });
                                    } else {
                                      setState(() {
                                        filtersSelected[categorySelected]
                                            .add(temp);
                                      });
                                    }
                                  },
                            child: Container(
                              width: width * 0.5,
                              height: height * 0.05,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: BorderDirectional(
                                  end: BorderSide(color: lightGrey, width: 2),
                                ),
                              ),
                              child: (i < filters[categorySelected].length)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          capitalize(
                                              filters[categorySelected][i]),
                                          style: montserrat(
                                            fontSize: fontSize(size: 'small'),
                                            color: isSelected(
                                                    categorySelected,
                                                    filters[categorySelected]
                                                        [i])
                                                ? Colors.white
                                                : blue,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        isSelected(categorySelected,
                                                filters[categorySelected][i])
                                            ? const Icon(
                                                LineIcons.check,
                                                color: Colors.white,
                                                size: 20,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : null,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ), // subfilter
            ],
          ), // actual filters
          Container(
            height: height * 0.1,
            width: width,
            color: backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.025),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        splashColor: backgroundColor,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Text(
                            'Clear All',
                            style: montserrat(
                                fontSize: fontSize(size: 'smallMedium'),
                                fontWeight: FontWeight.w600,
                                color: orange),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: height * 0.05,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: blue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Apply',
                              style: montserrat(
                                fontSize: fontSize(size: 'smallMedium'),
                                fontWeight: FontWeight.w600,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.025),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future bottomPopUpFilter(BuildContext context) async {
  String retVal = 'nothing';

  await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (BuildContext context) {
        return Container(
          // padding: const EdgeInsets.all(10),
          height: height * 0.43,
          decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5)
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style: montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize(size: 'small'),
                        color: darkGrey,
                      ),
                    ),
                    IconButton(
                        icon: Icon(LineIcons.times, color: Colors.grey[700]),
                        onPressed: () => Navigator.pop(context))
                  ],
                ),
              ),
              FilterPopUp(),
            ],
          ),
        );
      });
  return retVal;
}
