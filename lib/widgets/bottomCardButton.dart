import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

Container bottomCardButton(String title ,Function()? tap) {
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
    width: double.infinity,
    height: 116.h,
    child: Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 50, left: 13, right: 13),
      child: ElevatedButton(onPressed: tap, child: Text(title, style: txt16w5!.copyWith(color: Colors.white),),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
            ),
            backgroundColor: colorKmain
        ),),
    ),
  );
}