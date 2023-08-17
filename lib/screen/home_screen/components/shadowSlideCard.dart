import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

Container shadowSlideCard(BuildContext context,
    String image,
    String name,
    String job) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13),
    height: 147,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 30.w,
          child: Container(
            width: 293.w,
            height: 127.h,
            decoration: BoxDecoration(
                color: Color(0x330D53FC),
                borderRadius: BorderRadius.circular(6)),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 11.w,
          child: Container(
            width: 329.w,
            height: 127.h,
            decoration: BoxDecoration(
                color: Color(0x800D53FC),
                borderRadius: BorderRadius.circular(6)),
          ),
        ),
        Positioned(
            child: containerCardDoc(context,
                image,
                name,
                job,
                trailing: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(40, 40),
                        backgroundColor: Colors.white
                      ),
                        onPressed: () {
                        Navigator.pushNamed(context, DoctordetailScreen.routeName);
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.blue,
                          size: 16,
                        )))))
      ],
    ),
  );
}
