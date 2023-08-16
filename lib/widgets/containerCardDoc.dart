import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';
import '../screen/screens.dart';
import 'clipRRectAvatar.dart';

Container containerCardDoc(BuildContext context, {Widget? trailing}) {
  return Container(
    width: 349.w,
    height: 131.h,
    decoration: BoxDecoration(
        color: color0D53FC,
        borderRadius: BorderRadius.circular(6)
    ),
    child:  Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            trailing: trailing??SizedBox(),
            title: Text('Emma Watson', style: txt16w6!.copyWith(color: Colors.white),),
            subtitle: Text('Office Workers', style: txt14w4!.copyWith(color: Colors.white),),
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: clipRRectAvatar(48, 48)),
          ),
        ),
        SizedBox(height: 6.h,),
        Divider(color: Colors.black, height: 0,),
       // SizedBox(height: 8,),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
        }, child: Text('Date and Time', style: txt14w6!.copyWith(color: Colors.white),))


      ],
    ),
  );
}