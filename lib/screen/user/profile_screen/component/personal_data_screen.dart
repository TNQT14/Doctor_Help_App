import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../containts/containts.dart';
import '../../../../model/user/doctor_model.dart';
import '../../../../widgets/clipRRectAvatar.dart';
import '../../../../widgets/inputWidget.dart';
import '../../../home_screen/components/shadowSlideCard.dart';
import 'backgroundEditAvataCard.dart';
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
                child: BackGroundEditAvatCard(context, user1.imageUrl),
              ),
          Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name"),
                  inputWidget(user1.name, name),
                  const Text("Date of Birth"),
                  inputWidget("${DateFormat('yyyy-MM-dd').format(user1.birthDay)}", name),
                  const Text("Phone"),
                  inputWidget("${user1.phone}", name),
                  const Text("Address"),
                  inputWidget("${user1.experience}", name),
                ],
              )
          ),
        ],
      ),
    );
  }
}
