import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
              SizedBox(
                height: 100,
                  width: 100,
                  child: Lottie.asset(iconCheckSc, fit: BoxFit.cover)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.5.w, vertical: 25),
                child: Text(
                  'Appointment Booked',
                  style: txt32w7!.copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              containerCardDoc(context, trailing: ratingStar())
            ],
          ))),
          bottomCardButton('OK', () => Navigator.pop(context))
        ],
      ),
    );
  }
}
