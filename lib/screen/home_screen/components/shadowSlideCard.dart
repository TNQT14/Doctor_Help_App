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
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, DoctordetailScreen.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.arrow_forward_ios_rounded, color: colorKmain, size: 18),
                  ),
                )
            ))
      ],
    ),
  );
}

Container shadowSlideCardActive(BuildContext context,
    String image,
    String name,
    String job) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 13),
      height: 147,
      width: MediaQuery.of(context).size.width,
      child:containerCardDoc(context,
                image,
                name,
                job,
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppointmentSummaryScreen.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.arrow_forward_ios_rounded, color: colorKmain, size: 18),
                  ),
                )
      )
  );
}

Widget shadowSlideCardHistory(BuildContext context,
    String image,
    String name,
    String job) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 13),
      height: 147,
      width: MediaQuery.of(context).size.width,
      child:containerCardDocHistory(context,
          image,
          name,
          job,
          trailing: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppointmentSummaryScreen.routeName);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
              ),
              width: 40,
              height: 40,
              child: Icon(Icons.arrow_forward_ios_rounded, color: colorKmain, size: 18),
            ),
          )
      )
  );
}

