import 'package:doctor_help_app/VM/service/auth_service.dart';
import 'package:doctor_help_app/VM/validator.dart';
import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../screens.dart';
import '../forgot_password_screen/forgot_password_screen.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  UserBlocCubit _userCubit = UserBlocCubit();
}

class _LoginScreenState extends State<LoginScreen> {
  ValidatedMess validate = ValidatedMess();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 24.0.w, right: 197.w, top: 44.h, bottom: 64.h),
          child: Text(
            'Welcome Back',
            style: txt32w7,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextField(
                          hintext: 'Email',
                          text: email,
                          validator: (value) => validate.validatorEmail(value),
                          isPrefix: true,
                          image: iconMail),
                      const SizedBox(
                        height: 16,
                      ),
                      InputTextField(
                        hintext: 'Password',
                        text: password,
                        isPrefix: true,
                        image: iconKey,
                        isHideText: true,
                        validator: (value) => validate.validatorPassword(value),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 32.h),
                        child: Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                  // UserResponsitory().createUserFirestore(email.text, password.text);
                                  // AuthService().forgotPassword(email.text);
                                  Navigator.pushNamed(context, Forgotpasswordscreen.routeName);
                                  print("ádf");
                              },
                              child: Text(
                                'Forgot your password?',
                                style: txt14w4!.copyWith(color: colorKmain),
                              ),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<UserBlocCubit, UserBlocState>(
                          builder: (context, state) {
                        if (state is LoginLoading && state.isLoading == true) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: blueElevateButton(() {
                            if (_formKey.currentState!.validate()) {
                              // AuthService().loginService(email.text, password.text);
                              // Navigator.pushNamed(context, NavigationMenu.routeName);
                             widget._userCubit.loginCubit(context, email.text, password.text);
                            //  UserResponsitory().createUserFirestore(email.text, password.text);
                            }
                            // widget._userCubit.loginCubit(context, email.text, password.text);
                          }, 'Login'),
                        );
                      }),
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
                              () => Navigator.pushNamed(
                                  context, NavigationMenu.routeName)),
                          const SizedBox(
                            width: 24,
                          ),
                          bindAccount(
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Image.asset(iconGooglePlus),
                              ),
                              () => Navigator.pushNamed(
                                  context, NavigationMenu.routeName))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}

InkWell bindAccount(Widget child, Function()? tap) {
  return InkWell(
    onTap: tap,
    child: Container(
      width: 54.w,
      height: 54.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 3))
          ]),
      child: child,
    ),
  );
}
