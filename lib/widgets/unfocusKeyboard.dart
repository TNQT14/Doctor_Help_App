import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void unfocusKeyboard(BuildContext context){
  return FocusScope.of(context).unfocus();
}