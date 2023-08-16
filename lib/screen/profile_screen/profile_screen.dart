import 'package:flutter/material.dart';

import '../../containts/containts.dart';

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
      ),
    );
  }
}
