import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppointmentSuccessScreen extends StatelessWidget {
   AppointmentSuccessScreen({Key? key, required this.doctorModel}) : super(key: key);
  static String routeName = 'AppointmentSuccessScreen';
  DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    // SizedBox(
                    //   height: 100,
                    //   width: 100,
                    //   // child: Lottie.asset(iconCheckSc, fit: BoxFit.cover)
                    // ),
                      SvgPicture.asset(iconSuccess),
                    Text(
                      'Appointment Booked',
                      style: txt32w7!.copyWith(height: 1.5.h),
                      textAlign: TextAlign.center,
                      ).paddingOnly(left: 80.5.w, right: 80.5.w, bottom: 26.h),
                    containerCardDoc(context, doctorModel.imageUrl, doctorModel.name, doctorModel.job,
                  trailing: ratingStar(doctorModel.rating))
                  ],
          ))),
          bottomCardButton('OK', () => Navigator.pushNamed(context, NavigationMenu.routeName))
        ],
      ),
    );
  }
}
