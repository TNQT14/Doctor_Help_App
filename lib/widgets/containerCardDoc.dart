import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';
import '../screen/appointment_screen/appointment_dateTime_screen.dart';
import '../screen/screens.dart';
import 'clipRRectAvatar.dart';

Container containerCardDoc(
    BuildContext context, String image, String name, String job,
    {Widget? trailing}) {
  return Container(
    width: 349.w,
    height: 131.h,
    decoration: BoxDecoration(
        color: colorKmain, borderRadius: BorderRadius.circular(6)),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: clipRRectAvatar(46, 46, image),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(right: 16.w),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: txt14w4!.copyWith(color: Colors.white),
                        ),
                        Text(
                          job,
                          style: txt14w4!.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    Spacer(),
                    trailing??SizedBox()
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Color.fromARGB(255, 0, 47, 161),),
          InkWell(
            onTap: ()=>Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName),
            child: Text('Date and Time', style: txt14w6!.copyWith(color: Colors.white)),
          )
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          //   child: ListTile(
          //     trailing: trailing ?? SizedBox(),
          //     title: Text(
          //       name,
          //       style: txt16w6!.copyWith(color: Colors.white),
          //     ),
          //     subtitle: Text(
          //       job,
          //       style: txt14w4!.copyWith(color: Colors.white),
          //     ),
          //     contentPadding: EdgeInsetsDirectional.zero,
          //     leading: Container(
          //         width: 50.w,
          //         height: 50.h,
          //         padding: EdgeInsets.all(2),
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(6)),
          //         child: clipRRectAvatar(48, 48, image)
          //       ),
          //   ),
          // ),
          // Divider(
          //   color: Colors.black.withAlpha(150),
          //   height: 0,
          // ),
          // SizedBox(height: 8,),
          // TextButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
          //     },
          //     child: Text(
          //       'Date and Time',
          //       style: txt14w6!.copyWith(color: Colors.white),
          //     ))
        ],
      ),
    ),
  );
}

Container containerCardDocHistory(
    BuildContext context, String image, String name, String job,
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
                child: clipRRectAvatar(48, 48, image)),
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
