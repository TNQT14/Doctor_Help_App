import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

// Widget clipRRectAvatar(double width, double height) {
//   return Container(
//     width: width.w,
//     height: height.h,
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(6),
//         child: Image.asset(imageCat, fit: BoxFit.cover, width: width.w, height: height.h,)),
//   );
// }

Widget clipRRectAvatar(double width, double height, String image) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: (image ==null || image =='')?
      Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300
        ),
          child: Icon(Icons.person, color: Colors.black,)):
      Image.asset(image, fit: BoxFit.cover, width: width.w, height: height.h,));
}