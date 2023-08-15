import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

ClipRRect clipRRectAvatar(double width, double height) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: Image.asset(imageCale, fit: BoxFit.cover, width: width.w, height: height.h,),
  );
}