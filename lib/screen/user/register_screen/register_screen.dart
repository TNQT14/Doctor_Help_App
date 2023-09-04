import 'package:doctor_help_app/VM/service/auth_service.dart';
import 'package:doctor_help_app/VM/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';
import '../login_screen/login_screen.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  static String routeName = 'RegisterScreen';

  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ValidatedMess validatedMess = ValidatedMess();

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
            child: Column(children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextField(hintext: 'Email', text: email,
                          isPrefix: true,
                          image: iconMail,
                          validator: (value) =>
                              validatedMess.validatorEmail(value)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: InputTextField(hintext: 'Password', text: password,
                            isPrefix: true,
                            image: iconKey,
                            isHideText: true,
                            validator: (value) =>
                                validatedMess.validatorPassword(value)),
                      ),
                      InputTextField(hintext: 'Confirm Password', text: retypepassword,
                          isPrefix: true,
                          image: iconKey,
                          isHideText: true,
                          validator: (value) =>
                              validatedMess.validatorPassword(value)),
                      Container(
                        margin: EdgeInsets.only(top: 32.h),
                        width: double.infinity,
                        child: blueElevateButton(() {
                          if (_formKey.currentState!.validate()) {
                           // UserResponsitory().createUserFirestore(email.text, password.text);
                            AuthService().registerService(email.text, password.text, retypepassword.text);
                          }
                        }, 'Register'),
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
                  )),
            ]))
      ],
    );
  }
}
