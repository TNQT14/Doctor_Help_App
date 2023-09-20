// import 'package:doctor_help_app/containts/add_color.dart';
// import 'package:doctor_help_app/containts/add_images.dart';
// import 'package:doctor_help_app/model/user/user_model.dart';
// import 'package:doctor_help_app/screen/profile_screen/component/backgroundEditAvataCard.dart';
// import 'package:doctor_help_app/screen/screens.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../../model/user/doctor_model.dart';
// import '../../../../widgets/clipRRectAvatar.dart';
//
// Widget profileCard(
//   UserModel user,
//   Function()? ontap,
//   BuildContext context,
// ) {
//   return Card(
//     child: Container(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
//           child: Row(
//             children: [
//               BackGroundEditAvatCard(
//                   context: context,
//                   image: user.imageUrl ?? imagePersion,
//                   width: 56.w,
//                   height: 56.h,
//               paddingTop: 0).paddingOnly(right: 16.w),
//               // Padding(
//               //   padding: const EdgeInsets.fromLTRB(24.0, 24.0, 16.0, 24.0),
//               //   child: clipRRectAvatar(56, 56, user.imageUrl??imagePersion),
//               // ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const Text(
//                     "Hello",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: colorCardTitle,
//                     ),
//                   ),
//                   Text(
//                     user.name ?? 'Chưa có dữ liệu',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: colorTitle,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         IconButton(onPressed: ontap, icon: Icon(Icons.logout))
//       ],
//     )),
//   );
// }
