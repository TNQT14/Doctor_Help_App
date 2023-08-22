import 'package:doctor_help_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen/screens.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
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
      child:  LoginRegisterBackground(),
      designSize: Size(375, 812),
    );
  }
}
