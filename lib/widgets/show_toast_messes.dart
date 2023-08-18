
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../containts/containts.dart';

/// dùng để show mấy cái thông báo dưới màn hình khi thực hiện 1 hành động nào đó
/// p/s: (thử xóa mess để dễ hình dung)
/// Toast và SnackBar cùng công dụng như nhau, nhưng snackbar cần tham chiếu đến BuildContext (giải thích phức tạp, hiểu v dc r)
/// Toast thì không cần, gọi ra là dùng


// showToastMessage: Dùng khi cần design lại thông báo

void showToastMessage(BuildContext context ,String msg) {
  FToast toast = FToast();
  toast.init(context);
  toast.showToast(
    gravity: ToastGravity.BOTTOM,
  toastDuration: Duration(seconds: 3),
      child:containerShowSnackBar(msg));
}

//showFlutterToastMessage: không cần design, chỉ cần hiện thông báo

void showFlutterToastMessage(String msg) {
  // FToast toast = FToast();
  Fluttertoast.showToast(
    msg: msg
  );
}

//showSnackBar dùng SnackBar để hiện thông báo
void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: containerShowSnackBar(msg)));
}

//containerShowSnackBar: design bên trong của thông báo
Container containerShowSnackBar(String msg) {
  return Container(
    height: 56.h,
    padding: EdgeInsets.only(left: 16),
    // margin: const EdgeInsets.symmetric(horizontal: 13),
    decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     // offset: Offset(0, 5),
        //       blurRadius: 10,
        //       // spreadRadius: 1,
        //       color: Colors.grey.shade100
        //   )
        // ],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: Colors.grey.shade300
        )
    ),
    child: Row(
      children: [
        Icon(Icons.delete_outline, color: Colors.grey,),
        Text(msg, style: txt16w4!.copyWith(color: Colors.grey),),
        Spacer(),
        TextButton(onPressed: (){}, child: Text('Undo', style: txt14w6!.copyWith(color: colorKmain),))
      ],
    ),);
}