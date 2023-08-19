import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../containts/containts.dart';

Container cardDateTime() {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: 96.h,
    color: colorebf1f9,
    // decoration: BoxDecoration(
    //   color: colorebf1f9,
    // ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date', style: txt16w6,),
              Text('Time', style: txt16w4,),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('3 Days', style: txt14w6!.copyWith(color: Colors.grey),),
              Text('From Today', style: txt14w4!.copyWith(color: Colors.grey),),
            ],
          )
        ],
      ),
    ),
  );
}