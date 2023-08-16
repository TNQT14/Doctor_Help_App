import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  const AppointmentSuccessScreen({Key? key}) : super(key: key);
  static String routeName = 'AppointmentSuccessScreen';

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.5.w),
                child: Text(
                  'Appointment Booked',
                  style: txt32w7!.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ))),
          bottomCardButton('OK', () => null)
        ],
      ),
    );
  }
}
