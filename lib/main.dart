import 'package:doctor_help_app/VM/service/local/LocalizationService.dart';
import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/bloc/wrap_provider.dart';
import 'package:doctor_help_app/firebase_options.dart';
import 'package:doctor_help_app/routes.dart';
import 'package:doctor_help_app/screen/onboarding_screen/onboarding_screen.dart';
import 'package:doctor_help_app/screen/user/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screen/screens.dart';
import 'widgets/widgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const WrapProvider(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          // locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          // translations: Messages(language: language),
          // initialRoute: HomeScreen.routeName,
          routes: route,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child:  OnboardingScreens(),
      designSize: Size(375, 812),
    );
  }
}
