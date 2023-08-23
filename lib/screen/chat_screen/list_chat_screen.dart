import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/containts.dart';

class ListChatScreen extends StatelessWidget {
  ListChatScreen({Key? key}) : super(key: key);
  static String routeName = 'ListChatScreen';
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 75.h, left: 24.w),
            child: Text('Messages', style: txt32w7,),
          ),
          Expanded(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 22.0.h, bottom: 11.h ),
                  child: InputTextField(hintext: 'Search', text:  text, isPrefix: true, image: iconSearch),
                ),
                listMess(user1.name, user1.imageUrl, user1.description),
              ],
            ),),
          ),
          // bottomCardButton('ok', () => null)
        ],
      ),
    );
  }


}


