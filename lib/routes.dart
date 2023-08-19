
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/screen/user/profile_screen/component/personal_data_screen.dart';
import 'package:flutter/material.dart';

import 'model/user/doctor_model.dart';

// nơi chưa route (kiểu như dường dẫn đến các màn hình)

final Map<String, WidgetBuilder> route ={
  HomeScreen.routeName: (context)=> HomeScreen(),
  DoctordetailScreen.routeName: (context)=> DoctordetailScreen(),
  AppointmentDateTimeScreen.routeName: (context)=> AppointmentDateTimeScreen(),
  AppointmentSummaryScreen.routeName: (context)=> AppointmentSummaryScreen(),
  AppointmentSuccessScreen.routeName: (context)=> AppointmentSuccessScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ChatScreen.routeName: (context)=> ChatScreen(),
  LoginRegisterBackground.routeName: (context)=> LoginRegisterBackground(),
  PersonalDataScreen.routeName: (context)=> PersonalDataScreen(),
};