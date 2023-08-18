import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../containts/containts.dart';


DefaultTabController tabBarWidget(String? title1, String? title2, Widget? tab1,
Widget? tab2) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 35),
          Container(
            height: 36.h,
            width: 167.w,
            margin: EdgeInsets.only(left: 20),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
              indicator: ShapeDecoration(
                  color:Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: colorKmain,
                      ),
                      borderRadius: BorderRadius.circular(8))
              ),
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: colorKmain,
              tabs: [
                Tab( icon: Text(title1?? 'chưa set', style: txt14w6,),),
                Tab(icon: Text(title2?? 'chưa set', style: txt14w6,))
              ],
            ),
          ),
          Container(
            height: 739.h,
            width: double.infinity,
            child: TabBarView(children: [
              tab1?? Center(child: Text('chưa build UI tab1'),),
              tab2??Center(child: Text('chưa build UI tab2'),)
            ]),
          )
        ],
      ),
    ),
  );
}