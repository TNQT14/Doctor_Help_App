import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypepassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 24.0.w, right: 197.w, top: 44.h, bottom: 64.h),
          child: Text(
            'Create Account',
            style: txt32w7,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  inputWidget('Email', email, isPrefix: true, image: iconMail),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: inputWidget('Password',
                        password,
                        isPrefix: true, image: iconKey, isHideText: true),
                  ),
                  inputWidget('Confirm Password',
                      retypepassword,
                      isPrefix: true, image: iconKey, isHideText: true),
                  Container(
                    margin: EdgeInsets.only(top: 32.h),
                    width: double.infinity,
                    child: blueElevateButton(() => null, 'Register'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 56.h, bottom: 24.h),
                    alignment: Alignment.center,
                    child: Text(
                      'Or login using your social media',
                      style: txt14w4!.copyWith(color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bindAccount(
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            child: Image.asset(
                              iconFacebook,
                            ),
                          ),
                          () => null),
                      const SizedBox(
                        width: 24,
                      ),
                      bindAccount(
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            child: Image.asset(iconGooglePlus),
                          ),
                          () => null)
                    ],
                  )
                ],
              )
              )
            ],
          ),
        )
      ],
    );
  }
}
