import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
import '../../../widgets/clipRRectAvatar.dart';
import '../../../widgets/input_textField.dart';
import '../../home_screen/components/shadowSlideCard.dart';
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
          child: Text("Personal Data",
            style: txt16w6,),
        ),
        actions: [
          TextButton(onPressed: (){},
              child: const Text("Save")),
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
            padding: const EdgeInsets.all(13.0),
            child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",
                        style: txt16w4),
                    InputTextField(hintext: user1.name, text: name),
                    Text("Date of Birth",
                      style: txt16w4),
                    InputTextField(hintext: "${DateFormat('yyyy-MM-dd').format(user1.birthDay)}", text: name, isPrefix: true, image: iconSchedule),
                    Text("Phone",
                      style: txt16w4),
                    InputTextField(hintext: "${user1.phone}", text: name),
                    Text("Address",
                      style: txt16w4,),
                    InputTextField(hintext: "${user1.experience}", text: name),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
