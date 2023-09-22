import 'package:doctor_help_app/widgets/show_toast_messes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../containts/containts.dart';
import '../../../widgets/bluteElevateButton.dart';
import '../../../widgets/input_textField.dart';

GlobalKey<FormState> _forgotFormKey = GlobalKey<FormState>();

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);
  static String routeName = 'CheckYourEmailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "",
          style: txt18w7,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Check your mail',
            style: txt32w7,
          ).paddingOnly(top: 44.h, bottom: 8.h),
          Text(
            'We have sent a password recovery instructions to your email.',
            style: txt16w4.copyWith(color: Colors.grey),
            textAlign: TextAlign.justify,
          ).paddingOnly(bottom: 40.h),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: blueElevateButton(() {
                showFlutterToastMessage(
                    'Alright, We don\'t have that functionality now');
              }, 'Open my email')),
          Container(
              padding: EdgeInsets.only(top: 16.h),
              width: MediaQuery.of(context).size.width,
              child: blueElevateButton(() {}, 'Skip, i’ll confirm later',
                  color: Colors.white, isBlueText: true))
        ],
      ).paddingSymmetric(horizontal: 13.w),
    );
  }
}
