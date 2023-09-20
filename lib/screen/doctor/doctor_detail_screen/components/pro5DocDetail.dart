import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../containts/containts.dart';
import '../../../../widgets/widgets.dart';
//
// Expanded pro5DocDetail(BuildContext context, String image, double rating,
//     String description, String name, String job, String review) {
//   return Expanded(
//     child: SingleChildScrollView(
//         child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 13.0.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 8.h,),
//           textTitle('Profile Doctor', isPadding: false),
//           Padding(
//             padding: EdgeInsets.only(bottom: 8.h),
//             child: TextExpanded(
//               text: description,
//             ),
//           ),
//           textTitle('Schedule'),
//           DatePicker(
//             DateTime.now(),
//             initialSelectedDate: DateTime.now(),
//             selectionColor: Colors.white,
//             selectedTextColor: colorKmain,
//             onDateChange: (date) {
//               // New date selected
//               // setState(() {
//               //   _selectedValue = date;
//               // });
//             },
//             height: 90,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               textTitle('Reviews'),
//               GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   'See All',
//                   style: TextStyle(fontSize: 17.sp, color: colorKmain),
//                 ),
//               ),
//             ],
//           ),
//
//           //reviews
//           backgroundDoctorCard(
//               context,
//               Padding(
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//                 child: reviewsCard(image, rating, name, job, review),
//               ),
//               // height: 117.h
//               ),
//         ],
//       ),
//     )),
//   );
// }
//
Column reviewsCard(
    String image, double rating, String name, String job, String review) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      //in4
      Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            clipRRectAvatar(48, 48, image),
            SizedBox(width: 9.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? '',
                  style: txt16w6,
                ),
                Text(
                  job ?? '',
                  style: txt14w4,
                ),
              ],
            ),
            Spacer(),
            ratingStar(rating)
          ],
        ),
      ),
      Text(review ?? '')
    ],
  );
}
