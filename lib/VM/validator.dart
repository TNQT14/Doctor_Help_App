
import 'package:flutter/material.dart';

const EMOJI_REGEXP = r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
const MAX_LENGTH_CHARACTER = 50;
// const String EMAIL_REGEXP = r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
const String email_regexp = r"^[a-zA-Z0-9+_.-]*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
const String name_regexp = r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]$";

class ValidatedMess{
  String? validatorPassword(String? value) {
    if(value!.isEmpty){
      return 'Bạn chưa nhập password.';
    }
    else if(value!.length<6){
      return 'Password không được ít hơn 6 ký tự.';
    }
    // else if(RegExp(EMOJI_REGEXP).hasMatch(value)){
    //   return 'Password không được chứa ký tự đặt biệt.';
    // }
    else{
      return null;
    }
  }

  String? validatorEmail(String? value) {
    if (value!.isEmpty) {
      return 'Bạn chưa nhập Email.';
    }
    else if (value!.length < 6) {
      return 'Email không được ít hơn 6 ký tự.';
    }
    else if(!RegExp(email_regexp).hasMatch(value!)){
      return 'Kiểm tra lại email.';
    }
    // else if(value.contains(' ')){
    //   return 'Email không được có khoản trắng';
    // }
    else {
      return null;
    }
  }

}
