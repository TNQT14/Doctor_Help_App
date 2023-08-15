import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';

String image = imageCale2;
Row rowIn4() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: containerImage(image),
          title: Text('Current Location', style: txt14w4,),
          subtitle: Text('Enter an address', style: txt16w6!.copyWith(color: Colors.black),),

          ///DropDownButton
        ),
      ),
      InkWell(onTap: (){},
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 3
                )
              ]
          ),
          width: 32.w,
          height: 32.h,
          child: Image.asset(iconNotification, color: color0D53FC,
            width: 16.w,
            height: 18.h,),
        ),)
    ],
  );
}