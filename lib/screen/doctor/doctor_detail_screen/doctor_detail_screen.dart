import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 16),
                child: rowDocDetailIn4(user1.imageUrl, user1.name, user1.job),
              ),
              pro5DocDetail(context, user1.imageUrl, user1.rating,
                  user1.description, user1.name, user1.job,
              user1.review)
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottomCardButton('Make an appointment', () {
              Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            }),
          )
        ],
      ),
    );
  }
}
