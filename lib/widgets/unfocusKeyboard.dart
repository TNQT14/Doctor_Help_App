import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void unfocusKeyboard()=>FocusManager.instance.primaryFocus?.unfocus();