import 'package:doctor_help_app/containts/add_color.dart';
import 'package:doctor_help_app/screen/home_screen/home_screen.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import '../../../model/user/doctor_model.dart';

import '../../../containts/add_style.dart';
import '../../../widgets/tabBarWidget.dart';
import '../../home_screen/components/shadowSlideCard.dart';
import '../../user/login_screen/login_screen.dart';
import '../../user/register_screen/register_screen.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});
  static String routeName = 'AppointmentScreen';

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: colorbg,
        body: Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 75, left: 24),
              child: Text('My Appointment', style: txt32w7,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44.0),
              child: tabBarWidget('Active', 'History',
                  tab1: shadowSlideCardHistory(context, user1.imageUrl, user1.name, user1.job),
                  tab2: shadowSlideCardActive(context, user1.imageUrl, user1.name, user1.job)
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
