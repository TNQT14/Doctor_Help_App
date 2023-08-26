import 'package:doctor_help_app/model/disease/disease_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/containts.dart';
import '../../model/user/doctor_model.dart';
import '../../widgets/widgets.dart';
import 'components/doctorCard.dart';
import 'components/rowIn4.dart';
import 'components/shadowSlideCard.dart';
import 'components/listDisease.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusKeyboard(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colorbg,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 15, right: 15),
                child: rowIn4(user1.imageUrl),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0.w, right: 15.w,top: 22.h, bottom: 11),
                child: InputTextField(hintext: 'Search', text: search,isPrefix: true, image: iconSearch),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 11),
                            child: textTitle('My Appointment'),
                          ),
                          shadowSlideCard(
                              context, user1.imageUrl, user1.name, user1.job),
                        ],
                      ),
                      titleListNearDoc(),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            height: 124.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return doctorCard(context, user1.imageUrl,
                                      user1.rating, user1.name, user1.job);
                                }),
                          ),
                          listDisease(sick.nameDisease, sick.persion)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          // bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}

Padding titleListNearDoc() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textTitle('Nearby Doctor'),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See All',
            style: TextStyle(fontSize: 17.sp, color: colorKmain),
          ),
        )
      ],
    ),
  );
}
