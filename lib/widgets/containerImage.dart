import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container containerImage(String image, {double? width, double? height}) {
  return Container(
    width: width?? 54.w,
    height: height?? 54.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade300
    ),
    child: (image !=null || image != '') ? ClipRRect(
      child: Image.asset(image, fit: BoxFit.cover,),
      borderRadius: BorderRadius.circular(8),
    ) : Icon(Icons.person, color: Colors.grey.shade900, size: 40,),
  );
}

void unfocusKeyboard(BuildContext context){
  return FocusScope.of(context).unfocus();
}