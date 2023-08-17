import 'package:doctor_help_app/screen/profile_screen/profile_screen.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';

// nơi chưa route (kiểu như dường dẫn đến các màn hình)

final Map<String, WidgetBuilder> route ={
  HomeScreen.routeName: (context)=> HomeScreen(),
  DoctordetailScreen.routeName: (context)=> DoctordetailScreen(),
  AppointmentDateTimeScreen.routeName: (context)=> AppointmentDateTimeScreen(),
  AppointmentSummaryScreen.routeName: (context)=> AppointmentSummaryScreen(),
  AppointmentSuccessScreen.routeName: (context)=> AppointmentSuccessScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};