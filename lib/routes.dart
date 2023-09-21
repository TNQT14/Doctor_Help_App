

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/containts/add_images.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/navigationMenu.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_dateTime_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_success_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/appointment_summary_screen.dart';
import 'package:doctor_help_app/screen/appointment_screen/give_screen/give_screen.dart';
import 'package:doctor_help_app/screen/doctor/favorite_screen.dart';
import 'package:doctor_help_app/screen/onboarding_screen/onboarding_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/about_screen/about_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/notification_screen/notification_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/personal_data_screen/personal_data_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/profile_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/security_screen/security_screen.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/screen/user/forgot_password_screen/check_your_email_screen.dart';
import 'package:doctor_help_app/screen/user/forgot_password_screen/forgot_password_screen.dart';
import 'package:doctor_help_app/screen/user/login_screen/login_screen.dart';
import 'package:doctor_help_app/screen/user/register_screen/register_screen.dart';
import 'package:doctor_help_app/widgets/camera_screen.dart';
import 'package:doctor_help_app/widgets/view_picture.dart';
import 'package:flutter/material.dart';

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
  ChatScreen.routeName: (context) => ChatScreen(
        imageUrl: '',
        name: '',
        receiverID: '',
      ),

  //Appointment Screen
  // AppointmentDateTimeScreen.routeName: (context) => AppointmentDateTimeScreen(doc_name: '', doc_job: '', doc_image: '', doc_rate: null, doc_phone: '', doc_email: ''),
  AppointmentSummaryScreen.routeNameSummary: (context) =>
      AppointmentSummaryScreen(
        appBarTitle: 'Summary',
        bottomTitle: 'Make my appointment',
        doctorModel: userNull,
      ),
  AppointmentSummaryScreen.routeNameDetail: (context) =>
      AppointmentSummaryScreen(
        appBarTitle: 'Detail',
        bottomTitle: 'Give Your Reviews',
        doctorModel: userNull,
      ),
  AppointmentSuccessScreen.routeName: (context) => AppointmentSuccessScreen(
    doctorModel: userNull,
  ),
  AppointmentScreen.routeName: (context) => AppointmentScreen(),
  GiveReviewScreen.routeName: (context) => GiveReviewScreen(),

  //Favorite Screen
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  DoctordetailScreen.routeName: (context) => DoctordetailScreen(
        docDetail: userNull,
      ),

  //Profile Screen
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PersonalDataScreen.routeName: (context) => PersonalDataScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  AboutScreen.routeName: (context) => AboutScreen(),
  SecurityScreen.routeName: (context) => const SecurityScreen(),

  //Navigation
  NavigationMenu.routeName: (context) => NavigationMenu(),

  //Forgot
  Forgotpasswordscreen.routeName: (context) => Forgotpasswordscreen(),
  NavigationMenu.routeName: (context) => NavigationMenu(),
  LanguageScreen.routeName: (context) => LanguageScreen(),

  //Camera
  CameraScreen.routeName: (context) => CameraScreen(),
  ViewPicture.routeName: (context) {
    final String? capturedImagePath = ModalRoute.of(context)?.settings.arguments as String?;
    return ViewPicture(capturedImagePath: capturedImagePath);
  },
  CheckYourEmailScreen.routeName: (context) => CheckYourEmailScreen(),
};
