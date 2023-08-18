import 'package:flutter/material.dart';

import '../../../containts/add_style.dart';
class PersonalDataScreen extends StatefulWidget {
  static String routeName = 'PersonalDataScreen';

  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Data",
          style: txt32w7AppBar,),
      ),
    );
  }
}
