import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/appbar_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String routeName = 'ChatScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      body: Column(
        children: [
          appBarChat()
        ],
      ),
    );
  }


}



