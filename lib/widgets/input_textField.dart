import 'package:flutter/cupertino.dart';
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
//     {bool isPrefix = false,
//     String? image,
//     bool isHideText = false,
//       bool obscureText=false,
//     String? Function(String?)? validator,
//     }) {
//   // bool obscureText = false;
//   return TextFormField(
//     controller: text,
//     validator: validator,
//     obscureText: obscureText,
//     decoration: InputDecoration(
//         fillColor: Colors.white,
//         filled: true,
//         hintText: hintext,
//         hintStyle: txt16w4!.copyWith(color: Colors.grey.shade400),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
//         prefixIcon: isPrefix
//             ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Image.asset(
//                   image ?? imageCat,
//                   width: 18.w,
//                   height: 18.h,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             : const SizedBox(width: 15),
//         prefixIconConstraints: BoxConstraints(),
//         suffixIcon: isHideText
//             ? IconButton(
//                 onPressed: () {
//                   obscureText=!obscureText;
//                 },
//                 icon: Icon(
//                   CupertinoIcons.eye,
//                   color: Colors.grey,
//                 ))
//             : SizedBox(),
//         // border: OutlineInputBorder()
//
//         ///error
//         focusedErrorBorder:
//             OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
//         errorBorder:
//             OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
//
//         ///focus/ unFocus
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         focusedBorder:
//             OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
//   );
// }

class InputTextField extends StatefulWidget {
  InputTextField(
      {Key? key,
      required this.text,
      this.validator = null,
      required this.hintext,
      this.isHideText = false,
      this.isPrefix = false,
      this.image = ''})
      : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
  TextEditingController text;
  String? Function(String?)? validator;
  String hintext;
  bool isPrefix;
  bool isHideText;
  String image;
}

class _InputTextFieldState extends State<InputTextField> {
  bool obscureText = true;
  @override
  void initState() {
    widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.text,
      validator: widget.validator,
      obscureText: widget.isHideText ? obscureText: false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintext,
          hintStyle: txt16w4!.copyWith(color: Colors.grey.shade400),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
          prefixIcon: widget.isPrefix
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    (widget.image == null || widget.image == '')
                        ? imageCat
                        : widget.image,
                    width: 18.w,
                    height: 18.h,
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(width: 15),
          prefixIconConstraints: BoxConstraints(),
          suffixIcon: widget.isHideText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText?
                    CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    color: Colors.grey,
                  ))
              : SizedBox(),
          // border: OutlineInputBorder()

          ///error
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

          ///focus/ unFocus
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }
}

Widget textTitle(String title, {bool isPadding = true}) {
  return isPadding? Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0.h),
    child: Text(title, style: txt18w6),
  ): Text(title, style: txt18w6);
}
