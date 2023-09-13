//
// import 'package:doctor_help_app/model/language_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LocalizationService extends GetxController implements GetxService{
// final SharedPreferences sharedPreferences;
//
// LocalizationService({required this.sharedPreferences}){
//  loadCurrentLanguage();
// }
//
// static const fallbackLocale = Locale('en', 'US');
//
// Locale _locale = Locale(LanguageModel.language[0].lgCode, LanguageModel.language[0].countryCode);
// int _selectedIndext = 0;
//
// int get selectedIndext => _selectedIndext;
//
// List<LanguageModel> _language =[];
//
// Locale get locale => _locale;
// List<LanguageModel> get language =>_language;
//
// void loadCurrentLanguage() async{
//   _locale = Locale(sharedPreferences.getString(LanguageModel.LANGUAGE_CODE)?? LanguageModel.language[0].lgCode,
//   sharedPreferences.getString(LanguageModel.COUNTRY_CODE)?? LanguageModel.language[0].countryCode);
//
//   for(int index = 0; index < LanguageModel.language.length; index ++){
//     _selectedIndext = index;
//     break;
//   }
//   _language = [];
//   _language.addAll(LanguageModel.language);
//   update();
// }
//
// }
//
// class Messages extends Translations{
//   final Map<String, Map<String, String>> language;
//   Messages({required this.language});
//
//   @override
//   Map<String, Map<String, String>> get keys {
//     return language;
//   }
// }













import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
class LocalizationService extends Translations {

// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static final fallbackLocale = Locale('en', 'US');

// language code của những locale được support
  static final langCodes = [];

// các Locale được support
  static final locales = [
    // Locale('en', 'US'),
    // Locale('vi', 'VN'),
  ];


// cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
//   static final langs = LinkedHashMap.from({
//     'en': 'English',
//     'vi': 'Tiếng Việt',
//   });

// function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  static Map<String, Map<String, String>> listKeys = {};

  @override
  Map<String, Map<String, String>> keys = LocalizationService.listKeys;

  static String get language => getStringAsync('language', defaultValue: 'en_US');

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    // var lang = langCode ?? Get.deviceLocale!.languageCode;
    var lang = language;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }

}



