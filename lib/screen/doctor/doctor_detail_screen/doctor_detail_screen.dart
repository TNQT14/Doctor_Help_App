import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/widgets.dart';
import '../../appointment_screen/appointment_dateTime_screen.dart';
import 'components/pro5DocDetail.dart';
import 'components/rowDocDetailIn4.dart';

class DoctordetailScreen extends StatelessWidget {
  const DoctordetailScreen({Key? key}) : super(key: key);
  static String routeName = 'DoctordetailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: colorbg,
      appBar: appbarCustom(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 16.h, bottom: 8.h),
                    child: rowDocDetailIn4(user1.imageUrl, user1.name, user1.job),
                  ),
                  pro5DocDetail(context, user1.imageUrl, user1.rating,
                      user1.description, user1.name, user1.job,
                  user1.review)
                ],
              ),
            ),
            bottomCardButton('Make an appointment', () {
              Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
