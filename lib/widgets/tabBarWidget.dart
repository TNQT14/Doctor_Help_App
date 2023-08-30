import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../containts/containts.dart';

DefaultTabController tabBarWidget(String? title1, String? title2,
    {Widget? tab1, Widget? tab2}) {
  return DefaultTabController(
    length: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 36.h,
          width: 180.w,
          margin: EdgeInsets.only(left: 20),
          child: TabBar(
            dividerColor:Colors.transparent,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
            indicatorWeight: 0,
            indicator: ShapeDecoration(
                color: Colors.white,
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
              Tab(
                icon: Text(
                  title1 ?? 'chưa set',
                  style: txt14w6,
                ),
              ),
              Tab(
                  icon: Text(
                title2 ?? 'chưa set',
                style: txt14w6,
              ))
            ],
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: Container(
            child: TabBarView(children: [
              tab1 ??
                  Center(
                    child: Text('chưa build UI tab1'),
                  ),
              tab2 ??
                  Center(
                    child: const Text('chưa build UI tab2'),
                  )
            ]),
          ),
        )
      ],
    ),
  );
}
