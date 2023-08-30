import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../containts/containts.dart';

Container rowDocDetailIn4(String image, String name, String job) {
  return Container(
    height: 162.h,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        clipRRectAvatar(108, 162, image),
        SizedBox(width: 20.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name??'', style: txt18w7),
                Text(job??'', style: txt14w6!.copyWith(fontWeight: FontWeight.w500),),
              ],
            ),
            iconIn4(Icons.star, Colors.yellow, 'Rating', user1.rating, rates: 5400, index: true),
            iconIn4(Icons.work, Colors.blue, 'Experience', user1.experience)
          ],
        )
      ],
    ),
  );
}