import 'package:doctor_help_app/screen/user/login_screen/login_screen.dart';
import 'package:doctor_help_app/screen/user/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class LoginRegisterBackground extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  LoginRegisterBackground({
    super.key,
  });
  static String routeName = 'LoginRegisterBackground';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => unfocusKeyboard(context),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 44.0),
            child: tabBarWidget('Login', 'Register',
                tab1: LoginScreen(),
            tab2: RegisterScreen(),
          )),
        ));
  }
}