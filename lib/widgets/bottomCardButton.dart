import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

Container bottomCardButton(String title ,Function()? tap) {
  return Container(
    padding: EdgeInsets.only(top: 16.0.h, bottom: 16.h, left: 13.w, right: 13.w),
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
    child: blueElevateButton(tap, title),
  );
}

