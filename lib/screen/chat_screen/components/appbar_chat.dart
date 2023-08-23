import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';

Container appBarChat(BuildContext context, String image, String name) {
  return Container(
    padding: EdgeInsets.only(bottom: 5.h,),
    alignment: Alignment.bottomCenter,
    height: 100.h,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 3
          )
        ]
    ),
    child: Row(
      children: [
        IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new_outlined)),
        Padding(
          padding: EdgeInsets.only(left: 5.0.w, right: 16.w),
          child: clipRRectAvatar(36, 36, image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name, style: txt16w5,),
            Text('Online', style: txt12w4!.copyWith(color: Colors.grey),)
          ],
        ),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.phone_rounded, color: Colors.grey,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.grey,))
      ],
    ),
  );
}