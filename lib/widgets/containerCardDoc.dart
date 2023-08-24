import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';
import '../screen/appointment_screen/appointment_dateTime_screen.dart';
import '../screen/screens.dart';
import 'clipRRectAvatar.dart';

Container containerCardDoc(
    BuildContext context,
    String image,
    String name,
    String job,
    {Widget? trailing}) {
  return Container(
    width: 349.w,
    height: 131.h,
    decoration: BoxDecoration(
        color: colorKmain, borderRadius: BorderRadius.circular(6)),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            trailing: trailing ?? SizedBox(),
            title: Text(
              name,
              style: txt16w6!.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              job,
              style: txt14w4!.copyWith(color: Colors.white),
            ),
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: clipRRectAvatar(48, 48, image)
              ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Divider(
          color: Colors.black.withAlpha(150),
          height: 0,
        ),
        // SizedBox(height: 8,),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            },
            child: Text(
              'Date and Time',
              style: txt14w6!.copyWith(color: Colors.white),
            ))
      ],
    ),
  );
}

Container containerCardDocHistory(
    BuildContext context,
    String image,
    String name,
    String job,
    {Widget? trailing}) {
  return Container(
    width: 349.w,
    height: 131.h,
    decoration: BoxDecoration(
        color: colorCardTitleWhite, borderRadius: BorderRadius.circular(6)),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            trailing: trailing ?? SizedBox(),
            title: Text(
              name,
              style: txt16w6!.copyWith(color: Colors.black),
            ),
            subtitle: Text(
              job,
              style: txt14w4!.copyWith(color: Colors.black),
            ),
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: colorCardTitleWhite,
                    borderRadius: BorderRadius.circular(6)),
                child: clipRRectAvatar(48, 48, image)
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Divider(
          color: Colors.black.withAlpha(150),
          height: 0,
        ),
        // SizedBox(height: 8,),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            },
            child: Text(
              'Date and Time',
              style: txt14w6!.copyWith(color: colorCardTitle),
            ))
      ],
    ),
  );
}
