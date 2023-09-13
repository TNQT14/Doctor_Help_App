import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/screen/chat_screen/chat_screen.dart';
import 'package:doctor_help_app/widgets/unfocusKeyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
import '../../../widgets/clipRRectAvatar.dart';
import '../../../widgets/input_textField.dart';
import 'component/backgroundEditAvataCard.dart';

class PersonalDataScreen extends StatefulWidget {
  static String routeName = 'PersonalDataScreen';

  PersonalDataScreen({Key? key}) : super(key: key);
  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypepassword = TextEditingController();

  @override
  void initState() {
    UserBlocCubit.get(context).getUserDataDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> unfocusKeyboard(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorbg,
          centerTitle: true,
          title: Text(
            "Personal Data",
            style: txt16w6,
          ),
          actions: [
            TextButton(onPressed: () {

            }, child: const Text("Save")),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight
                ),
                child: BlocBuilder<UserBlocCubit, UserBlocState>(builder: (context, state) {
                  if(state is UserSuccess){
                    print(state.user.phone);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Center(
                          child: BackGroundEditAvatCard(context, state.user.imageUrl??imagePersion, true),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                          child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text("Name"),
                                  InputTextField(hintext: state.user.name??"No data", text: name),
                                  text("Date of Birth"),
                                  InputTextField(
                                      hintext:
                                      "${formatDatetime(state.user.birthday ?? Timestamp.now())}",
                                      text: birthday,
                                      isPrefix: true,
                                      image: iconSchedule),
                                  text("Phone"),
                                  InputTextField(hintext: "${"0${state.user.phone}"?? 'xxx-xxxx-xxxx'}", text: phone),
                                  text("Address"),
                                  InputTextField(hintext: state.user.address??"No data", text: address),
                                ],
                              )),
                        ),
                        const SizedBox(height: 15,)
                      ],
                    );
                  }
                  return Center( child:  CircularProgressIndicator(),);
                })
                ),
              );
          },
        ),
      )
    );
  }
}

Padding text(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9.h),
    child: Text(title, style: txt16w4),
  );
}
