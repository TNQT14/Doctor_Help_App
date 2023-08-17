import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

Widget iconIn4(IconData iconData, Color color, title, var in4, {bool index = false, int rates = 0}) {
  return Container(
    height: 36.h,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 36.h,
          width: 36.w,
          margin:const EdgeInsets.only(right: 8),
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
          children: [Text(title, style: txt12w4!.copyWith(color: Colors.grey.shade400),),
         //   Text( '5.0 (5410)', style: txt14w5!.copyWith(color: Colors.black),)
          index?
          RichText(text: TextSpan(
              text:'${in4.toString()}',
              style: txt14w5!.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: ' (${rates})',
                  style: txt14w5!.copyWith(color: Colors.grey)
                )
              ]
            )) :
          Text('${in4.toString()}', style:  txt14w5!.copyWith(color: Colors.black),)
          ],
        )
      ],
    ),
  );
}