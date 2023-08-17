import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';

Container rowDocDetailIn4(String image, String name, String job) {
  return Container(
    height: 162.h,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        clipRRectAvatar(108, 162, image),
        const SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(name??'', style: txt18w7),
            ),
            Text(job??'', style: txt14w6!.copyWith(fontWeight: FontWeight.w500),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: iconIn4(Icons.star, Colors.yellow, 'Rating'),
            ),
            iconIn4(Icons.work, Colors.blue, 'Experience')
          ],
        )
      ],
    ),
  );
}