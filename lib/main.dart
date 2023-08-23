import 'package:doctor_help_app/bloc/wrap_provider.dart';
import 'package:doctor_help_app/firebase_options.dart';
import 'package:doctor_help_app/routes.dart';
import 'package:doctor_help_app/screen/user/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      // ScreenUtilInit để reSize màn hình,
      // nó sẽ đo theo thông số màn hình trong figma(cái design mình đang code theo)
      // rồi co giãn để phù hợp với mọi loại thiết bị
      builder: (context, child) {
        return MaterialApp(
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
      child:  AuthGate(),
      designSize: Size(375, 812),
    );
  }
}
