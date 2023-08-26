import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

Expanded pro5DocDetail(BuildContext context,
    String image,
    double rating,
    String description,
    String name,
    String job,
    String review) {
  return Expanded(
    child: SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Profile Doctor'),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: reviewsCard(image, rating, name, job, review),
              ),
              height: 117.h),
          SizedBox(
            height: 130,
          )
        ],
      ),
    )),
  );
}

Column reviewsCard(
    String image, double rating, String name, String job, String review) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        trailing: ratingStar(rating),
        title: Text(
          name,
          style: txt16w6,
        ),
        subtitle: Text(
          job,
          style: txt14w4,
        ),
        contentPadding: EdgeInsetsDirectional.zero,
        leading: clipRRectAvatar(48, 48, image),
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(review),
      ),
    ],
  );
}
