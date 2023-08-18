import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>unfocusKeyboard(context),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 44.0),
            child: tabBarWidget('Login', 'Register',
            tab1: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.0.w, right: 197.w, top: 44.h, bottom: 64.h),
                  child: Text('Welcome Back', style: txt32w7,),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    Form(child: Column(
                      children: [
                        inputWidget('Email', isPrefix: true),
                        const SizedBox(height: 16,),
                        inputWidget('Password', isPrefix: true),
                        Padding(padding: EdgeInsets.only(top: 16.h, bottom: 32.h),
                        child: Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                print('object');
                              },
                              child: Text('Forgot your password?', style: txt14w4!.copyWith(color: colorKmain),),
                            )
                          ],
                        ),),
                        SizedBox(
                          width: double.infinity,
                          child: blueElevateButton(() => null, 'Login'),
                        )
                      ],
                    ))
                  ],
                ),)
              ],
            )),
          ),
        ));
  }
}
