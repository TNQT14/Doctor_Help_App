import 'package:doctor_help_app/containts/containts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/rowDocDetailIn4.dart';

class DoctordetailScreen extends StatelessWidget {
  const DoctordetailScreen({Key? key}) : super(key: key);
  static String routeName = 'DoctordetailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorF9f9fe,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 20),
              child: rowDocDetailIn4(),
            ),
            Text('Profile Doctor')
          ],
        ),
      ),
    );
  }


}


