import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointment_success_screen.dart';
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
                  doctorContactCard(context, chat: true,),
                  textTitle('Patient Information'),
                  doctorContactCard(context),
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

Container doctorContactCard(BuildContext context, {bool chat = false}) {
  return backgroundDoctorCard(context, Padding(
    padding: const EdgeInsets.only(top: 8 ,bottom: 16, left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          trailing: chat? GestureDetector(
            onTap: (){ print('ok');},
            child:
            //Icon(CupertinoIcons.chat_bubble_text, color: Colors.blue,)
            Container(
              margin: EdgeInsets.only(right: 5.w),
              width: 25.w, height: 25.h, child: Image.asset(iconChat, color: colorKmain,),),
          ) : SizedBox(),
          title: Text(user1.name, style: txt16w6,),
          subtitle: Text(user1.job, style: txt14w4,),
          contentPadding: EdgeInsetsDirectional.zero,
          leading: clipRRectAvatar(56, 56, user1.imageUrl),
        ),
        Divider(thickness: 1, height: 10,),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0.h, top: 11.h),
          child: iconIn4(Icons.phone, Colors.blue, 'Phone', user1.phone),
        ),
        iconIn4(Icons.mail, Colors.red, 'Email', user1.email)
      ],
    ),
  ), height: 222.h);
}
