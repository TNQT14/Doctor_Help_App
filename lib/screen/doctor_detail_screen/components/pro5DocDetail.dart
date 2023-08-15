import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

Expanded pro5DocDetail(BuildContext context) {
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
                child: TextExpanded(text: txt,),
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
                      style: TextStyle(fontSize: 17.sp, color: color0D53FC),
                    ),
                  ),
                ],
              ),
              backgroundDoctorCard(context, Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: reviewsCard(),
              ),
              height: 117.h),
              SizedBox(height: 130,)
            ],
          ),
        )
    ),
  );
}



Column reviewsCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        trailing: ratingStar(),
        title: Text('Emma Watson', style: txt16w6,),
        subtitle: Text('Office Workers', style: txt14w4,),
        contentPadding: EdgeInsetsDirectional.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(imageCale, fit: BoxFit.cover, width: 48.w, height: 48.h,),
        ),
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text('i feel very comfortable with doctor claire'),
      ),
    ],
  );
}