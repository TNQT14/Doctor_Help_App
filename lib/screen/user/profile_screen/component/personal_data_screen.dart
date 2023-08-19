import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../containts/containts.dart';
import '../../../../model/user/doctor_model.dart';
import '../../../../widgets/clipRRectAvatar.dart';
import '../../../home_screen/components/shadowSlideCard.dart';
import 'backgroundEditAvataCard.dart';
class PersonalDataScreen extends StatefulWidget {
  static String routeName = 'PersonalDataScreen';

  PersonalDataScreen({Key? key}) : super(key: key);
  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
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
              child: Text("Save")),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Center(
              child: BackGroundEditAvatCard(context, user1.imageUrl),
          ),
        ],
      ),
    );
  }
}
