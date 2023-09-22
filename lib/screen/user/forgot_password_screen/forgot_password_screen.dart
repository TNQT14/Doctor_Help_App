import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/containts/containts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../VM/service/auth_service.dart';
import '../../../VM/validator.dart';
import '../../../widgets/bluteElevateButton.dart';
import '../../../widgets/input_textField.dart';
import '../../../widgets/unfocusKeyboard.dart';
import 'check_your_email_screen.dart';

GlobalKey<FormState> _forgotFormKey = GlobalKey<FormState>();

class Forgotpasswordscreen extends StatefulWidget {
  Forgotpasswordscreen({super.key});
  static String routeName = "Forgotpasswordscreen";

  @override
  State<Forgotpasswordscreen> createState() => _ForgotpasswordscreenState();
  UserBlocCubit _userBlocCubit = UserBlocCubit();
}

class _ForgotpasswordscreenState extends State<Forgotpasswordscreen> {
  ValidatedMess validate = ValidatedMess();

  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "",
            style: txt18w7,
          ),
        ),
        body: GestureDetector(
          onTap: () => unfocusKeyboard(),
          child: buildColumn().paddingSymmetric(horizontal: 13.w),
        ));
  }

  Column buildColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Form(
            key: _forgotFormKey,
            child: Column(
              children: [
                Container(child: Image.asset(imageForgot)),
                InputTextField(
                    hintext: 'Email',
                    text: email,
                    validator: (value) => validate.validatorEmail(value),
                    isPrefix: true,
                    image: iconMail
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: BlocBuilder<UserBlocCubit, UserBlocState>(
                      builder: (context, state){
                        if(state is LoginLoading && state.isLoading == true){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: blueElevateButton(() {
                            if (_forgotFormKey.currentState!.validate()) {
                              AuthService().forgotPassword(email:email.text, context: context);
                              Navigator.pop(context);//  UserResponsitory().createUserFirestore(email.text, password.text);
                            }
                          }, 'Reset Password'),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// Column buildColumnNextPage() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Check your mail',
//         style: txt32w7,
//       ).paddingOnly(top: 44.h, bottom: 8.h),
//       Text(
//         'Enter the email associated with your account and we’ll send an email with instructios to reset your password.',
//         style: txt16w4.copyWith(color: Colors.grey),
//         textAlign: TextAlign.justify,).paddingOnly(bottom: 40.h),
//       Form(key: _forgotFormKey,
//         child: Column(
//           children: [
//             InputTextField(
//                 hintext: 'Email',
//                 text: email,
//                 validator: (value) => validate.validatorEmail(value),
//                 isPrefix: true,
//                 image: iconMail
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 32.h.h),
//               child: BlocBuilder<UserBlocCubit, UserBlocState>(
//                   builder: (context, state){
//                     if(state is LoginLoading && state.isLoading == true){
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     return SizedBox(
//                       width: double.infinity,
//                       child: blueElevateButton(() {
//                         if (_forgotFormKey.currentState!.validate()) {
//                           AuthService().forgotPassword(email: email.text, context: context);
//                           //  UserResponsitory().createUserFirestore(email.text, password.text);
//                         }
//                       }, 'Reset Password'),
//                     );
//                   }
//               ),
//             )
//           ],
//         ),)
//     ],
//   );
// }


