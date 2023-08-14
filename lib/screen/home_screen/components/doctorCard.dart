import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';

Container doctorCard() {
  return Container(
    width: 319.w,
      height: 124.h,
      margin: EdgeInsets.only(left: 15.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5.0, bottom: 5),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Image.asset(imageCat, fit: BoxFit.cover, width: 72.w, height: 108.h,),
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Arus Elim'),
                  Text('Hepatologist'),
                  Spacer(),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text('4.5'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Spacer(),
                Container(
                    width: 53.w,
                    margin: EdgeInsets.only(right: 15.w, bottom: 10.h),
                    height: 26.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsetsDirectional.zero,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Status',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    )),
              ],
            )
          ],
        ),
      ));
}