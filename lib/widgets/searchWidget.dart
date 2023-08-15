import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

Container searchWidget() {
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
          prefixIcon: Icon(Icons.search),
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