import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '/universal_variables.dart';

class MultiOptionDropdown extends StatefulWidget {
  final List<String> names;
  final List<dynamic> values;
  // final Callback onChanged;
  final String initialValue;
  final double widthFactor;
  final VoidCallback popOverlay;
  final WidgetCallback pushOverlay;
  bool error;

  MultiOptionDropdown({
    required this.names,
    required this.values,
    // required this.onChanged,
    required this.initialValue,
    required this.popOverlay,
    required this.pushOverlay,
    this.widthFactor = 1,
    this.error = false,
  });

  @override
  _MultiOptionDropdownState createState() => _MultiOptionDropdownState();
}

class _MultiOptionDropdownState extends State<MultiOptionDropdown> {
  late int count;
  String currValue = '';

  @override
  initState() {
    count = widget.names.length;
    currValue = widget.initialValue;
    super.initState();
  }

  Widget child() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return Positioned(
      left: offset.dx,
      top: (offset.dy + (size.height * count) + 10.0 <
              (0.9 * MediaQuery.of(context).size.height))
          ? offset.dy + size.height + 10.0
          : offset.dy - (size.height * count) - 10,
      width: size.width,
      height: size.height * count,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 2)),
            ],
          ),
          child: Column(
            children: [
              for (int i = 0; i < count; i++)
                GestureDetector(
                  onTap: () {
                    /*
                    setState(
                      () {
                        currValue = widget.names[i];
                        widget.error = false;
                      },
                    );
                    widget.onChanged(
                      widget.values[i],
                    );*/
                    widget.popOverlay();
                  },
                  child: Container(
                    height: size.height,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: (i != count - 1)
                              ? BorderSide(
                                  color: Colors.grey[350]!,
                                )
                              : BorderSide.none),
                    ),
                    child: Text(
                      widget.names[i],
                      style: montserrat(
                        fontSize: fontSize(size: 'extraSmall'),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => widget.pushOverlay(child()),
      child: Container(
        height: height / 20,
        width: widget.widthFactor * width / 1.2,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: (widget.error)
              ? Border.all(color: Colors.red)
              : Border(
                  bottom: BorderSide.none,
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(2, 2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currValue,
              style: montserrat(
                fontSize: fontSize(size: 'extraSmall'),
                color: (currValue == widget.initialValue || widget.error)
                    ? (widget.error)
                        ? Colors.red
                        : Colors.grey
                    : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => widget.pushOverlay(child()),
              iconSize: 20,
              color: Colors.grey[700],
              icon: Icon(
                LineIcons.chevronDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
