import 'package:esummit_sports/data_models/equipment_model.dart';
import 'package:esummit_sports/screens/secondary_screens/equipment_detail_screen.dart';
import 'package:flutter/material.dart';

import '../universal_variables.dart';

Widget productTile(BuildContext context,
    {required EquipmentModel data, bool? network, required bool isSmall}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EquipmentDetailScreen(),
        ),
      );
    },
    child: Container(
      width: isSmall ? width * 0.44 : width * 0.5,
      height: isSmall ? width * 0.6 : width * 0.67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(10, 10),
          )
        ],
      ),
      alignment: Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              // color: Colors.red,
              padding: const EdgeInsets.all(10),
              child: (network == false)
                  ? Image.asset('assets/images/bat.png')
                  : (data.coverImg != null)
                      ? Image.network(data.coverImg!)
                      : Image.asset('assets/images/coaching.png'),
            ),
          ),
          SizedBox(
            width: width * 0.42,
            height: width * 0.15,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.25,
                  child: Text(
                    data.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: montserrat(
                      fontSize: fontSize(size: 'smallMedium'),
                      color: Colors.grey[800],
                      // color: blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '₹ ' + (data.cost ?? 0).toInt().toString(),
                  style: montserrat(
                    fontSize: fontSize(size: 'extraSmall'),
                    color: Colors.grey[800],
                    // color: blue,
                    fontWeight: FontWeight.w400,
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
