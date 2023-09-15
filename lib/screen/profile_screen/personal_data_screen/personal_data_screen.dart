import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/bloc/fillForm/fillForm_bloc_cubit.dart';
import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/widgets/unfocusKeyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../../VM/service/user_responsitory.dart';
import '../../../../VM/service/user_responsitory.dart';
import '../../../../VM/service/user_responsitory.dart';
import '../../../../VM/validator.dart';
import '../../../../containts/containts.dart';
import '../../../../widgets/input_textField.dart';
import '../component/backgroundEditAvataCard.dart';

GlobalKey<FormState> _formDataKey = GlobalKey<FormState>();

class PersonalDataScreen extends StatefulWidget {
  static String routeName = 'PersonalDataScreen';

  PersonalDataScreen({Key? key}) : super(key: key);
  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
  UserResponsitory _userResponsitory = UserResponsitory();
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
    FillFormBlocCubit.get(context).filledForm(context, name.text, birthday.text,
        phone.text,address.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValidatedMess validate = ValidatedMess();
    // if(name.text.isNotEmpty && birthday.text.isNotEmpty && phone.text.isNotEmpty&& address.text.isNotEmpty )
      if(name.text.isEmpty || birthday.text.isEmpty || phone.text.isEmpty|| address.text.isEmpty )
      {
        print('Form rỗng');
        print("Tên ${name.text.length}");
        print("birthday ${birthday.text.length}");
        print("phone ${phone.text.length}");
        print("address ${address.text.length}");
      }
    else {
      print('Form không rỗng');
      print("Tên ${name.text}");
      print("birthday ${birthday.text}");
      print("phone ${phone.text}");
      print("address ${address.text}");
    }

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
            BlocBuilder<FillFormBlocCubit, FillFormBlocState>(
              builder: (context, stateFillForm) {
                return BlocBuilder<UserBlocCubit, UserBlocState>(
                  builder: (context, stateUser) {
                    if (stateUser is UserSuccess) {
                      final isFormFilled =
                          name.text.isNotEmpty &&
                          birthday.text.isNotEmpty &&
                          phone.text.isNotEmpty &&
                          address.text.isNotEmpty;
                        return SizedBox(
                          child: TextButton(
                            onPressed: isFormFilled
                                ? () {
                              if (_formDataKey.currentState!.validate()) {
                                widget._userResponsitory.updateUserDetail(
                                  name.text,
                                  birthday.text,
                                  phone.text,
                                  address.text,
                                );
                                showDialog(
                                    context: context,
                                    builder: (context){
                                     return AlertDialog(
                                        title: Text("Thành công"),
                                        content: Text("Thông tin của bạn đã được cập nhật trên hệ thống"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    }
                                );
                                  // Navigator.pop(context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Lỗi"),
                                      content: const Text("Vui lòng điền đúng thông tin"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                                : null,
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: isFormFilled ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ),
                        );

                    }


                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight
                ),
                child:  BlocBuilder<FillFormBlocCubit, FillFormBlocState>(
                    builder: (context, stateFillForm){
                      return BlocBuilder<UserBlocCubit, UserBlocState>(builder: (context, stateUser) {
                        if(stateUser is UserSuccess){
                          // print(state.user.phone);
                          // DateTime? dateTime = state.user.birthday;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                child: BackGroundEditAvatCard(context, stateUser.user.imageUrl??imagePersion, true),
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
                                          hintext: stateUser.user.name ??"No data",
                                          text: name,
                                          // isPrefix: true,
                                          validator: (value)
                                          => validate.vadilationName(value),
                                        ),
                                        text("Date of Birth"),
                                        InputTextField(
                                          hintext:
                                          "${stateUser.user.birthday?? Timestamp.now()}",
                                          text: birthday,
                                          isPrefix: true,
                                          image: iconSchedule,
                                          validator: (value) =>
                                              validate.vadilationBirthday(value),
                                        ),
                                        text("Phone"),
                                        InputTextField(
                                          hintext: "${"0${stateUser.user.phone}"?? 'xxx-xxxx-xxxx'}",
                                          text: phone,
                                          validator: (value) =>
                                              validate.vadilationPhone(value),
                                        ),
                                        text("Address"),
                                        InputTextField(hintext: stateUser.user.address??"No data",
                                          text: address,
                                          validator: (value) =>
                                              validate.vadilationAddress(value),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(height: 15,)
                            ],
                          );
                        }
                        return Center( child:  CircularProgressIndicator(),);
                      });
                    }
                )
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
