import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../containts/containts.dart';

class AppointmentDateTimeScreen extends StatelessWidget {
  const AppointmentDateTimeScreen({Key? key}) : super(key: key);
  static String routeName = 'AppointmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      appBar: appbarCustom(context),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doctorDateTimeAppointmentCard(context),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: textTitle('Date & Time'),
                ),
                Center(
                  child: Text('Appointment schedule'),
                )
              ],
            ),
          )),
          bottomCardButton(
              'Next',
              () => Navigator.pushNamed(
                  context, AppointmentSummaryScreen.routeName))
        ],
      ),
    );
  }
}


//card thông tin doctor
Padding doctorDateTimeAppointmentCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: backgroundDoctorCard(
      context,
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: clipRRectAvatar(56, 84, user1.imageUrl),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    user1.name,
                    style: txt18w7,
                  ),
                ),
                Text(
                  user1.job,
                  style: txt14w5!.copyWith(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
      height: 100.h,
    ),
  );
}
