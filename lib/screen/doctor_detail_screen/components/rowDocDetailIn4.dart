import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';

Container rowDocDetailIn4() {
  return Container(
    height: 162.h,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        clipRRectAvatar(108, 162),
        const SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text('Claire Lime', style: txt18w7),
            ),
            Text('Gynecologist', style: txt14w6!.copyWith(fontWeight: FontWeight.w500),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: iconIn4(Icons.star, Colors.yellow),
            ),
            iconIn4(Icons.work, Colors.blue)
          ],
        )
      ],
    ),
  );
}

Widget iconIn4(IconData iconData, Color color) {
  return Container(
    height: 36.h,
    width: 117.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 36.h,
          width: 36.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(iconData, color: color,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Rating', style: txt12w4!.copyWith(color: Colors.grey.shade400),),
            Text('5.0 (5410)', style: txt14w5!.copyWith(color: Colors.black),)],
        )
      ],
    ),
  );
}