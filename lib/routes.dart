import 'package:doctor_help_app/containts/add_images.dart';
import 'package:doctor_help_app/navigationMenu.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_dateTime_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_success_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_summary_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/give_screen/give_screen.dart';
import 'package:doctor_help_app/screen/doctor/favorite_screen.dart';
import 'package:doctor_help_app/screen/onboarding_screen/onboarding_screen.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/screen/user/login_screen/login_screen.dart';
import 'package:doctor_help_app/screen/user/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'model/user/doctor_model.dart';

// nơi chưa route (kiểu như dường dẫn đến các màn hình)

final Map<String, WidgetBuilder> route = {
  OnboardingScreens.routeName: (context) => OnboardingScreens(),
  LoginRegisterBackground.routeName: (context) => LoginRegisterBackground(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),

  //Home Screen
  HomeScreen.routeName: (context) => HomeScreen(),

  //Chat Screen
  ListChatScreen.routeName: (context) => ListChatScreen(),
  // ChatScreen.routeName: (context)=> ChatScreen(room:),

  //Appointment Screen
  AppointmentDateTimeScreen.routeName: (context) => AppointmentDateTimeScreen(),
  AppointmentSummaryScreen.routeNameSummary: (context) =>
      AppointmentSummaryScreen(
        appBarTitle: 'Summary',
        bottomTitle: 'Make my appointment',
      ),
  AppointmentSummaryScreen.routeNameDetail: (context) =>
      AppointmentSummaryScreen(
        appBarTitle: 'Detail',
        bottomTitle: 'Give Your Reviews',
      ),
  AppointmentSuccessScreen.routeName: (context) => AppointmentSuccessScreen(),
  AppointmentScreen.routeName: (context) => AppointmentScreen(),
  GiveReviewScreen.routeName: (context) => GiveReviewScreen(),

  //Favorite Screen
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  DoctordetailScreen.routeName: (context) => DoctordetailScreen(),

  //Profile Screen
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PersonalDataScreen.routeName: (context) => PersonalDataScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),

  //Navigation
  NavigationMenu.routeName: (context) => NavigationMenu(),
};
