
import 'package:flutter/material.dart';

class ValidatedMess{
  String? validatorPassword(String? text) {
    if (text!.isEmpty) {
      return 'Mật khẩu không được trống';
    }
    else if(text!.length<6){
      return 'Mật khẩu không được ít hơn 6 ký tự';
    }
    return null;
  }
}


final formKey = GlobalKey<FormState>();