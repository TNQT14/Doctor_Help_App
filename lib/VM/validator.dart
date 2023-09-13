import 'package:intl/intl.dart';

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

  String? vadilationName(String? name){
    if(name!.isEmpty){
      return 'Bạn chưa nhập tên';
    }
    else
      return null;
  }

  String? vadilationPhone(String? phone){
    final RegExp phonePattern = RegExp(r'^[0-9]{10}$');
    if(phone!.isEmpty){
      return 'Bạn chưa nhập SĐT';
    }
    if (!phonePattern.hasMatch(phone)) {
      return 'Số điện thoại không hợp lệ';
    }
    else
      return null;
  }

  String? vadilationBirthday(String? birthday){
    if(birthday!.isEmpty){
      return 'Bạn chưa nhập ngày sinh';
    }
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    try {
      final DateTime parsedDate = dateFormat.parse(birthday);
      return null;
    } catch (e) {
      return 'Ngày sinh không hợp lệ';
    }
  }

  String? vadilationAddress(String? address){
    if(address!.isEmpty){
      return 'Bạn chưa nhập địa chỉ';
    }
    else
    if (address.length < 5) {
      return 'Địa chỉ quá ngắn';
    }
      return null;
  }

  bool validationForm(String? name, String? phone, String? birthday, String? address){
    if(vadilationName(name)==false ||
        vadilationPhone(phone) == false ||
        vadilationBirthday(birthday)==false ||
        vadilationAddress(address)==false)
      return false;
    else
    return true;
  }

}
