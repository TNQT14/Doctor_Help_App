import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';

Container appBarChat() {
  return Container(
    padding: EdgeInsets.only(bottom: 5.h,),
    alignment: Alignment.bottomCenter,
    height: 100.h,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 15,
              spreadRadius: 5
          )
        ]
    ),
    child: Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        Padding(
          padding: EdgeInsets.only(left: 5.0.w, right: 16.w),
          child: clipRRectAvatar(36, 36, imageCale),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Emma Scheider', style: txt16w5,),
            Text('Online', style: txt12w4!.copyWith(color: Colors.grey),)
          ],
        ),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.phone, color: Colors.grey,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.grey,))
      ],
    ),
  );
}