import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

Container bottomCardButton(String title ,Function()? tap) {
  return Container(
    padding: const EdgeInsets.only(top: 16.0, bottom: 50, left: 13, right: 13),
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
    child: blueElevateButton(tap, title),
  );
}

