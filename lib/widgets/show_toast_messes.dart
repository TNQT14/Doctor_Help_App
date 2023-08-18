
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../containts/containts.dart';


void showToastMessage(BuildContext context ,String msg) {
  FToast toast = FToast();
  toast.init(context);
  toast.showToast(
  toastDuration: Duration(seconds: 3),
      child:Container(
        height: 56.h,
        padding: EdgeInsets.only(left: 16),
        // margin: const EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                // offset: Offset(0, 5),
                  blurRadius: 10,
                  // spreadRadius: 1,
                  color: Colors.grey.shade100
              )
            ],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: Colors.grey.shade300
            )
        ),
        child: Row(
          children: [
            Icon(Icons.delete_outline, color: Colors.grey,),
            Text('Message Deleted', style: txt16w4!.copyWith(color: Colors.grey),),
            Spacer(),
            TextButton(onPressed: (){}, child: Text('Undo', style: txt14w6!.copyWith(color: colorKmain),))
          ],
        ),));
}

// void showToastMessage(String msg) {
//   // FToast toast = FToast();
//   Fluttertoast.showToast(
//     msg: msg
//   );
// }