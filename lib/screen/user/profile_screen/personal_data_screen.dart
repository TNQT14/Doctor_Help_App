import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/screen/chat_screen/chat_screen.dart';
import 'package:doctor_help_app/widgets/unfocusKeyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../VM/service/user_responsitory.dart';
import '../../../VM/validator.dart';
import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
import '../../../widgets/clipRRectAvatar.dart';
import '../../../widgets/input_textField.dart';
import 'component/backgroundEditAvataCard.dart';

GlobalKey<FormState> _formDataKey = GlobalKey<FormState>();

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
    ValidatedMess validate = ValidatedMess();
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
            // TextButton(onPressed: () {
            //   UserResponsitory().updateUserDetail(name.text, birthday.text, phone.text, address.text);
            // }, child: const Text("Save")),
            BlocBuilder<UserBlocCubit, UserBlocState>(
                builder: (context, state){
                  if(state is FilledFormLoading && state.isFilling == false) {
                    return SizedBox(
                         child:  TextButton(onPressed: () {
                              UserResponsitory().updateUserDetail(name.text, birthday.text, phone.text, address.text);
                           }, child: const Text("Save", style: TextStyle(color: Colors.grey),)),
                       ) ;
                  }
                  return SizedBox(
                         child:  TextButton(onPressed: () {
                           UserResponsitory().updateUserDetail(name.text, birthday.text, phone.text, address.text);
                         }, child: const Text("Save")),
                       )

                  // if(state is FilledFormError)
                  //   return Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // return
                  // validate.validationForm(name.text, phone.text, birthday.text, address.text) ?
                  //  SizedBox(
                  //   child:  TextButton(onPressed: () {
                  //        UserResponsitory().updateUserDetail(name.text, birthday.text, phone.text, address.text);
                  //     }, child: const Text("Save")),
                  // ) :SizedBox(
                  //   child:  TextButton(onPressed: () {
                  //     UserResponsitory().updateUserDetail(name.text, birthday.text, phone.text, address.text);
                  //   }, child: const Text("Save", style: TextStyle(color: Colors.grey),)),
                  // )
                  ;
                }
            )
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
                    // DateTime? dateTime = state.user.birthday;
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
                            key: _formDataKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text("Name"),
                                  InputTextField(
                                    hintext: state.user.name ??"No data",
                                    text: name,
                                    isPrefix: true,
                                    validator: (value) => validate.vadilationName(value),
                                  ),
                                  text("Date of Birth"),
                                  InputTextField(
                                      hintext:
                                      "${state.user.birthday?? Timestamp.now()}",
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
  GlobalKey<FormState> formDataKey = GlobalKey<FormState>();
}

Padding text(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9.h),
    child: Text(title, style: txt16w4),
  );
}
