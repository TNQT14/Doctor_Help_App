import 'package:card_swiper/card_swiper.dart';
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 20.h, bottom: 20.h),
                child: rowIn4(user1.imageUrl),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0.w, right: 15.w, bottom: 8.h),
                child: InputTextField(
                    hintext: 'Search',
                    text: search,
                    isPrefix: true,
                    image: iconSearch),
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
                            padding: EdgeInsets.only(left: 15.0.w),
                            child: textTitle('My Appointment'),
                          ),
                          Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return containerCardDoc(context, listdoc[index].imageUrl,
                                  listdoc[index].name, listdoc[index].job,
                                  trailing: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          DoctordetailScreen.routeName);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(6)),
                                      width: 40.w,
                                      height: 40.h,
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: colorKmain,
                                          size: 18),
                                    ),
                                  ));
                            },
                            itemCount: listdoc.length,
                            itemWidth: double.infinity,
                            itemHeight: 131.0.h,
                            layout: SwiperLayout.TINDER,
                          )
                          // shadowSlideCard(
                          //     context, user1.imageUrl, user1.name, user1.job),
                        ],
                      ),
                      titleListNearDoc(),
                      Container(
                        height: 124.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return doctorCard(context, user1.imageUrl,
                                  user1.rating, user1.name, user1.job);
                            }),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      listDisease(sick.nameDisease, sick.persion)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}

Padding titleListNearDoc() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
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
