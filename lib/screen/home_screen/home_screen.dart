import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/containts.dart';
import '../../widgets/widgets.dart';
import 'components/doctorCard.dart';
import 'components/rowIn4.dart';
import 'listDisease.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusKeyboard(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.call),
          //       label: 'Calls',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.camera),
          //       label: 'Camera',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.chat),
          //       label: 'Chats',
          //     ),
          //   ],
          // ),
          backgroundColor: colorbg,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 35.0, left: 15, right: 15),
                child: rowIn4(),
              ),
              inputWidget(),
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
                            padding: const EdgeInsets.only(left: 15.0, top: 22),
                            child: textTitle('My Appointment'),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, DoctordetailScreen.routeName);
                            },
                              child: doctorCard(context)),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                      titleLisstNearDoc(),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            height: 124.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return doctorCard(context);
                                }),
                          ),
                          listDisease()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

Padding titleLisstNearDoc() {
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
            style: TextStyle(fontSize: 17.sp, color: color0D53FC),
          ),
        )
      ],
    ),
  );
}
