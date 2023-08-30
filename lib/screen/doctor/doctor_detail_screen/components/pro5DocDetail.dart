import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../containts/containts.dart';
import '../../../../widgets/widgets.dart';

Expanded pro5DocDetail(BuildContext context, String image, double rating,
    String description, String name, String job, String review) {
  return Expanded(
    child: SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h,),
          textTitle('Profile Doctor', isPadding: false),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: TextExpanded(
              text: description,
            ),
          ),
          textTitle('Schedule'),
          Container(
              width: double.infinity,
              height: 117.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textTitle('Reviews'),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 17.sp, color: colorKmain),
                ),
              ),
            ],
          ),
          backgroundDoctorCard(
              context,
              Padding(
                padding:
                    EdgeInsets.only(left: 16.0.w, right: 16.w, bottom: 5.h),
                child: reviewsCard(image, rating, name, job, review),
              ),
              height: 117.h),
        ],
      ),
    )),
  );
}

Column reviewsCard(
    String image, double rating, String name, String job, String review) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          clipRRectAvatar(48, 48, image),
          SizedBox(width: 9.w,),
          Column(
            children: [
              Text(
                name ?? '',
                style: txt16w6,
              ),
              Text(
                job ?? '',
                style: txt14w4,
              ),
            ],
          ),
          Spacer(),
          ratingStar(rating)
        ],
      ),
      // ListTile(
      //   trailing: ratingStar(rating),
      //   title: Text(
      //     name ?? '',
      //     style: txt16w6,
      //   ),
      //   subtitle: Text(
      //     job ?? '',
      //     style: txt14w4,
      //   ),
      //   contentPadding: EdgeInsetsDirectional.zero,
      //   leading: clipRRectAvatar(48, 48, image),
      // ),
      Text(review ?? '')
    ],
  );
}
