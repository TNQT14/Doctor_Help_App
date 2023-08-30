import 'package:doctor_help_app/screen/doctor/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/add_color.dart';
import '../../containts/add_style.dart';
import '../../model/user/doctor_model.dart';
import 'components/status_doctor_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static String routeName = 'FavoriteScreen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: colorbg,
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 75.h, left: 24.w),
                child: Text('My Doctor', style: txt32w7,),
              ),
              Expanded(
                  child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context, DoctordetailScreen.routeName),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: statusDoctorCard(context, user1.imageUrl,
                              user1.rating, user1.name, user1.job, false),
                            ),
                          );
                        }
                    ),
                  ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}

