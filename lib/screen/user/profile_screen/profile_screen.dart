import 'package:flutter/material.dart';

import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
import 'component/profileCard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String routeName = 'ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: colorbg,
        appBar: AppBar(
          title: Text('My Profile',
          style: txt32w7AppBar,
          ),
          elevation: 0.0,
          backgroundColor: colorbg,
        ),
        body:Container(
          child: Column(
            children: <Widget>[
              profileCard(user1),
            ],
          ),
        ),
        // bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}