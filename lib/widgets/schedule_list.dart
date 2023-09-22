import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

SizedBox scheduleList() {
  return SizedBox(
    // width: double.infinity,
    height: 75.h,
    child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: daymodel.listSchedule.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 7.w),
            alignment: Alignment.center,
            width: 43.72.w,
            // height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: (daymodel.listSchedule[index].schedule == 'yes')
                      ? Colors.grey.shade300
                      : Colors.transparent),
              color: (daymodel.listSchedule[index].schedule == 'yes')
                  ? Colors.white
                  : Color(0xffEBF1F9),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  daymodel.week[index],
                  style: txt12w4!.copyWith(color: Colors.grey),
                ),
                Text(
                  daymodel.listSchedule[index].day.toString(),
                  style: txt15w6!.copyWith(
                      color: (daymodel.listSchedule[index].schedule == 'yes')
                          ? colorKmain
                          : Colors.grey),
                )
              ],
            ),
          );
        }),
  );
}

class daymodel {
  static List<String> week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static List<String> month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  int day;
  String schedule;
  daymodel({required this.day, required this.schedule});

  static List<daymodel> listSchedule = [
    daymodel(day: 18, schedule: 'no'),
    daymodel(day: 19, schedule: 'no'),
    daymodel(day: 20, schedule: 'no'),
    daymodel(day: 21, schedule: 'no'),
    daymodel(day: 22, schedule: 'yes'),
    daymodel(day: 23, schedule: 'yes'),
    daymodel(day: 24, schedule: 'no'),
  ];
}