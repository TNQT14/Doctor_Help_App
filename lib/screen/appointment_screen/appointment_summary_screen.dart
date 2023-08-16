import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/cardDateTime.dart';
class AppointmentSummaryScreen extends StatelessWidget {
  const AppointmentSummaryScreen({Key? key}) : super(key: key);
  static String routeName = 'AppointmentSummaryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCustom(context, title: Text('Summary', style: txt16w6!.copyWith(color: Colors.black),)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textTitle('Consultation Schedule'),
                  cardDateTime(),
                  textTitle('Doctor Information'),
                  doctorIn4Card(context),
                  textTitle('Patient Information'),
                  doctorIn4Card(context),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          )),
          bottomCardButton('Make my appointment', () => Navigator.pushNamed(context, AppointmentSuccessScreen.routeName))
        ],
      ),
    );
  }
}

Container doctorIn4Card(BuildContext context) {
  return backgroundDoctorCard(context, Padding(
    padding: const EdgeInsets.only(top: 8 ,bottom: 16, left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.chat, color: Colors.blue,),),
          title: Text('Emma Watson', style: txt16w6,),
          subtitle: Text('Office Workers', style: txt14w4,),
          contentPadding: EdgeInsetsDirectional.zero,
          leading: clipRRectAvatar(56, 56),
        ),
        Divider(thickness: 1, height: 10,),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0.h, top: 11.h),
          child: iconIn4(Icons.phone, Colors.blue),
        ),
        iconIn4(Icons.mail, Colors.red)
      ],
    ),
  ), height: 222.h);
}
