import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../model/disease/disease_model.dart';
import '../../../widgets/widgets.dart';

Widget listDisease() {
  return Container(
    height: 416.h,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 4.h, width: 32.w,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey
            ),),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h),
              child: ListView.builder(
                  padding: EdgeInsetsDirectional.zero,
                  itemCount: listSick.length,
                  itemBuilder: (context, indext){
                    return Padding(
                      padding: EdgeInsets.only(top: 16.0.h),
                      child: diseaseCard(listSick[indext].nameDisease, listSick[indext].persion, listSick[indext].image),
                    );
                  }),
            ),
          ),
        ],
      )
  );
}



Container diseaseCard(String name, int index, String icon) {
  return Container(
    alignment: Alignment.center,
    width: 349.w,
    height: 70.h,
    padding: EdgeInsets.only(left: 16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
          color: Colors.grey.shade300
      ),
    ),
    child:
    Row(
      children: [
        Container(
          child: clipRRectAvatar(40, 40, icon),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(right: 16.w),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name??'', style: txt16w6,),
            Text('$index Doctor', style: txt14w6!.copyWith(fontWeight: FontWeight.w400, color: Colors.grey),)
          ],
        ),
      ],
    )
    // ListTile(
    //   leading: Image.asset(icon, width: 40.w, height: 40.h,),
    //   title: Text(name??'', style: txt16w6,),
    //   subtitle: Text('$index Doctor', style: txt14w6!.copyWith(fontWeight: FontWeight.w400),),
    // ),
  );
}


// class bottomSheet extends StatelessWidget {
//   const bottomSheet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DraggableScrollableSheet(
//         initialChildSize: 0.8,
//           minChildSize: 0.8,
//           maxChildSize: 1,
//           builder: (context, scrollController){
//         return Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//           ),
//           child:  Column(
//             children: [
//               Container(height: 4.h, width: 32.w,
//                 margin: EdgeInsets.only(top: 15),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.grey
//                 ),),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
//                   child: ListView.builder(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                     controller: scrollController,
//                       padding: EdgeInsetsDirectional.zero,
//                       itemCount: 10,
//                       itemBuilder: (context, indext){
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 10.0),
//                           child: diseaseCard(),
//                         );
//                       }),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }