import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

///có thể sử dụng như input/field
///
/// để tránh phức tạp thì những prefixIcon (icon mình nhìn thấy ở đầu cái TextField)
/// sẽ mặc định dùng hình để nhét vào (tìm trong libary của flutter không có đâu, có thì cũng phải tìm packet)
/// isPrefix: có dùng icon ở đầu thanh nhập hay không? mặc định là không, muốn dùng thì đổi thành true
/// image: link của cái hình để mình nhét vào, nếu không nhét ảnh nào vào thì mặc định là hình con mèo,
/// hintext: bắt buộc phải nhập, không nhập báo lỗi

SizedBox inputWidget(String hintext,
    {bool isPrefix = false, String? image }) {
  return SizedBox(
    height: 50.h,
    // padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: TextField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintext,
          hintStyle: txt16w4!.copyWith(color: Colors.grey.shade400),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
          prefixIcon: isPrefix? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              image?? imageCat,
              width: 18.w,
              height: 18.h,
              fit: BoxFit.cover,
            ),
          ) :const SizedBox(width: 15),
          prefixIconConstraints: BoxConstraints(),
          // prefixIconColor: Colors.grey.shade400,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    ),
  );
}

Padding textTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text(title, style: txt18w6),
  );
}
