// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../containts/containts.dart';
//
// Widget listDisease(String name, int index) {
//   return Container(
//     height: 416.h,
//       margin: EdgeInsets.only(top: 10.h),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(height: 4.h, width: 32.w,
//             margin: EdgeInsets.only(top: 15),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.grey
//             ),),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
//               child: ListView.builder(
//                   padding: EdgeInsetsDirectional.zero,
//                   itemCount: 10,
//                   itemBuilder: (context, indext){
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: diseaseCard(name, index),
//                     );
//                   }),
//             ),
//           ),
//         ],
//       )
//   );
// }
//
//
//
// Container diseaseCard(String name, int index) {
//   return Container(
//     alignment: Alignment.center,
//     width: 349.w,
//     height: 70.h,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       border: Border.all(
//           color: Colors.grey.shade300
//       ),
//     ),
//     child: ListTile(
//       leading: Image.asset(iconGastroenterology, width: 40.w, height: 40.h,),
//       title: Text(name, style: txt16w6,),
//       subtitle: Padding(
//         padding: const EdgeInsets.only(top: 6.0),
//         child: Text('$index Doctor', style: txt14w6!.copyWith(fontWeight: FontWeight.w400),),
//       ),
//     ),
//   );
// }
//
//
// // class bottomSheet extends StatelessWidget {
// //   const bottomSheet({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: DraggableScrollableSheet(
// //         initialChildSize: 0.8,
// //           minChildSize: 0.8,
// //           maxChildSize: 1,
// //           builder: (context, scrollController){
// //         return Container(
// //           width: double.infinity,
// //           decoration: BoxDecoration(
// //             color: Colors.blue,
// //           ),
// //           child:  Column(
// //             children: [
// //               Container(height: 4.h, width: 32.w,
// //                 margin: EdgeInsets.only(top: 15),
// //                 decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(8),
// //                     color: Colors.grey
// //                 ),),
// //               Expanded(
// //                 child: Container(
// //                   padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
// //                   child: ListView.builder(
// //                       physics: const AlwaysScrollableScrollPhysics(),
// //                     controller: scrollController,
// //                       padding: EdgeInsetsDirectional.zero,
// //                       itemCount: 10,
// //                       itemBuilder: (context, indext){
// //                         return Padding(
// //                           padding: const EdgeInsets.only(top: 10.0),
// //                           child: diseaseCard(),
// //                         );
// //                       }),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }