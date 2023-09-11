import 'package:doctor_help_app/containts/add_style.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../VM/service/local/LocalizationService.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  static String routeName = 'LanguageScreen';

  @override
  Widget build(BuildContext context) {
    List<String> _listLanguage = ['Vietnamese', 'English'];
    String _selectedLang = LocalizationService.locale!.languageCode;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle('Choose your language'.tr, isPadding: false),
            Expanded(child: ListView.separated(
              separatorBuilder: (context, indext)=> Divider(height: 0,),
              itemCount: _listLanguage.length,
                itemBuilder: (context, indext) {
                return InkWell(
                  onTap: (){
                    // print(_selectedLang);
                  },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 2.w),
                      child: Text(_listLanguage[indext], style: txt16w4,),
                    ));
                })),
          ],
        ),
      ),
    );
  }
}


