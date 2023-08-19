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


// TextFormField inputWidget(String hintext, TextEditingController text,
// {bool isPrefix = false,
// String? image,
// bool isHideText = false,
// String? Function(String?)? validator}){
//   return TextFormField(
//     controller: text,
//     validator: validator,
//     decoration: InputDecoration(
//       contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
//       hintText: hintext,
//       border: OutlineInputBorder()
//     ),
//   );
// }

TextFormField inputWidget(String hintext, TextEditingController text,
    {bool isPrefix = false,
    String? image,
    bool isHideText = false,
    String? Function(String?)? validator}) {
  return TextFormField(
    controller: text,
    validator: validator,
    obscureText: isHideText,
    decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintext,
        hintStyle: txt16w4!.copyWith(color: Colors.grey.shade400),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
        prefixIcon: isPrefix
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  image ?? imageCat,
                  width: 18.w,
                  height: 18.h,
                  fit: BoxFit.cover,
                ),
              )
            : const SizedBox(width: 15),
        prefixIconConstraints: BoxConstraints(),
        // border: OutlineInputBorder()

        ///error
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

        ///focus/ unFocus
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
    ),
  );
}

Padding textTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text(title, style: txt18w6),
  );
}
