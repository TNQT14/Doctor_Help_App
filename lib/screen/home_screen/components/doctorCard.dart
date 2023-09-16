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
        padding: EdgeInsets.only(left: 6.w, top: 8.h, bottom: 8.h, right: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            clipRRectAvatar(72, 108, image),
            SizedBox(
              width: 10.w,
            ),

            //in4
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    name,
                    style: txt16w6,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
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

                        //status
            const Spacer(),
            Column(
              children: [
                const Spacer(),
                InkWell(
                  onTap: (){print('object');},
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 14.h),
                    width: 53.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff53A1FD),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text('Status', style: txt12w4!.copyWith(color: Colors.white),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      width: 319.w,
      // height: 124.h,
      margin: true);
}

Container backgroundDoctorCard(BuildContext context, Widget child,
    {
      // double? height,
     double? width,
      bool margin = false}) {
  return Container(
      // alignment: Alignment.center,
      width: width ?? MediaQuery.of(context).size.width,
      // height: height ?? MediaQuery.of(context).size.height,
      margin: margin ? EdgeInsets.only(left: 15.w) : EdgeInsetsDirectional.zero,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300)),
      child: child);
}
