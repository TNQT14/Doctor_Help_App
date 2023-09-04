import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  TextEditingController password = TextEditingController();
  TextEditingController retypepassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      appBar: AppBar(
        backgroundColor: colorbg,
        title: Center(
          child: Text(
            "Personal Data",
            style: txt16w6,
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Save")),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: BackGroundEditAvatCard(context, user1.imageUrl, true),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0.w),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text("Name"),
                InputTextField(hintext: user1.name, text: name),
                text("Date of Birth"),
                InputTextField(
                    hintext:
                        "${DateFormat('yyyy-MM-dd').format(user1.birthDay.toDate())}",
                    text: name,
                    isPrefix: true,
                    image: iconSchedule),
                text("Phone"),
                InputTextField(hintext: "${user1.phone}", text: name),
                text("Address"),
                InputTextField(hintext: "${user1.experience}", text: name),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

Padding text(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9.h),
    child: Text(title, style: txt16w4),
  );
}
