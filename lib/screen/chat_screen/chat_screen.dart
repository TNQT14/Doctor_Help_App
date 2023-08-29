import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/appbar_chat.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  static String routeName = 'ChatScreen';
  TextEditingController mess = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      body: Column(
        children: [
          appBarChat(context, user1.imageUrl, user1.name),
          Expanded(child: SingleChildScrollView(
            child: Container(),
          )),
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      spreadRadius: 2
                  )
                ]
            ),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(iconFile),
                ),
                SizedBox(
                  width: 248.w,
                  child: InputTextField(text: mess, hintext: 'Type Message'),
                ),
                InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(iconMic),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}



