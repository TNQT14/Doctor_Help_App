import 'package:doctor_help_app/navigationMenu.dart';
import 'package:doctor_help_app/screen/doctor/appointment_screen/appointment_screen.dart';
import 'package:doctor_help_app/screen/doctor/give_screen/give_screen.dart';
import 'package:doctor_help_app/screen/onboarding_screen/onboarding_screen.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/screen/user/login_screen/login_screen.dart';
import 'package:doctor_help_app/screen/user/notification_screen/notification_screen.dart';
import 'package:doctor_help_app/screen/user/profile_screen/personal_data_screen.dart';
import 'package:doctor_help_app/screen/user/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'model/user/doctor_model.dart';

// nơi chưa route (kiểu như dường dẫn đến các màn hình)

final Map<String, WidgetBuilder> route ={
  OnboardingScreens.routeName: (context)=> OnboardingScreens(),
  LoginRegisterBackground.routeName: (context)=> LoginRegisterBackground(),
  LoginScreen.routeName: (context)=>LoginScreen(),
  RegisterScreen.routeName: (context)=>RegisterScreen(),

  AppointmentDateTimeScreen.routeName: (context)=> AppointmentDateTimeScreen(),
  AppointmentSummaryScreen.routeName: (context)=> AppointmentSummaryScreen(),
  AppointmentSuccessScreen.routeName: (context)=> AppointmentSuccessScreen(),
  AppointmentScreen.routeName: (context)=> AppointmentScreen(),

  ListChatScreen.routeName: (context)=> ListChatScreen(),
  ChatScreen.routeName: (context)=> ChatScreen(),

  HomeScreen.routeName: (context)=> HomeScreen(),
  DoctordetailScreen.routeName: (context)=> DoctordetailScreen(),

  ProfileScreen.routeName: (context) => ProfileScreen(),
  PersonalDataScreen.routeName: (context)=> PersonalDataScreen(),

  NavigationMenu.routeName: (context)=> NavigationMenu(),
  GiveReviewScreen.routeName: (context)=> GiveReviewScreen(),

  NotificationScreen.routeName: (context)=> NotificationScreen(),
};