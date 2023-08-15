import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

Container bottomCardButton() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              spreadRadius: 3
          ),
        ]
    ),
    height: 116.h,
    child: Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 50, left: 13, right: 13),
      child: ElevatedButton(onPressed: (){}, child: Text('Make an appointment', style: txt16w5,),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
            ),
            backgroundColor: color0D53FC
        ),),
    ),
  );
}