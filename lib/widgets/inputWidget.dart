import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

///có thể sử dụng như input/field

Container inputWidget() {
  return Container(
    height: 50.h,
    margin: const EdgeInsets.only(top: 22),
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
          filled: true,
          hintText: 'Search',
          hintStyle: txt16w4!.copyWith(color: Colors.grey.shade400),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(iconSearch, width: 18.w, height: 18.h,),
          ),
          prefixIconConstraints: BoxConstraints(),
          // prefixIconColor: Colors.grey.shade400,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey.shade300
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue
              )
          )
      ),
    ),
  );
}

Padding textTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text(
        title,
        style: txt18w6
    ),
  );
}