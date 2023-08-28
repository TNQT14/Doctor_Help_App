import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';

Widget doctorCard(
    BuildContext context,
    String image,
    double rating,
    String name,
    String job) {
  return backgroundDoctorCard(
      context,
      Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            clipRRectAvatar(72, 108, image),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: txt16w6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0.h),
                    child: Text(job,
                        style: txt14w6!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400)),
                  ),
                  const Spacer(),
                  ratingStar(rating),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Spacer(),
                Container(
                    width: 53.w,
                    margin: EdgeInsets.only(right: 14.w, bottom: 14.h),
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
      ),
      width: 319.w,
      height: 124.h,
      margin: true);
}

Container backgroundDoctorCard(BuildContext context, Widget child,
    {double? height, double? width, bool margin = false}) {
  return Container(
      // alignment: Alignment.center,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.width,
      margin: margin ? EdgeInsets.only(left: 15.w) : EdgeInsetsDirectional.zero,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300)),
      child: child);
}
