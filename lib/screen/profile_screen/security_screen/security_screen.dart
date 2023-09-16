import 'package:doctor_help_app/containts/add_color.dart';
import 'package:flutter/material.dart';

import '../../../containts/add_style.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  static String routeName = "SecurityScreen";

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorbg,
        title: Text("Security",style: txt16w6,),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            
          ],
        ),
      ),
    );
  }
}
