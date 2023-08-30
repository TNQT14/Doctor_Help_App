import 'package:doctor_help_app/containts/containts.dart';
import 'package:flutter/material.dart';
import 'package:doctor_help_app/screen/screens.dart';

import '../../../../model/user/doctor_model.dart';
import '../../../../widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static String routeName = 'NotificationScreen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      appBar: AppBar(
        backgroundColor: colorbg,
        title: Center(child: Text("Notification",
        style: txt16w6,)),
        actions: [
          TextButton(onPressed: (){},
              child: const Text("Clear All")),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  listNotification(user1.name, user1.imageUrl, user1.description),
                ],
              ),),
          ),
        ],
      )
    );
  }
}
