import 'package:doctor_help_app/containts/add_style.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../VM/service/local/LocalizationService.dart';

class lanlguage{
  String name;
  String local;
  lanlguage({required this.name, required this.local});
}

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  static String routeName = 'LanguageScreen';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    List<lanlguage> _listLanguage = [];
    // LocalizationService.langs.forEach((key, value) {
    //   _listLanguage.add(lanlguage(name: value, local: key));
    // });
    // String _selectedLang = LocalizationService.locale!.languageCode;

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
                    setState(() {
                      // LocalizationService.changeLocale(_listLanguage[indext].local);
                    });
                  },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 2.w),
                      child: Text(_listLanguage[indext].name, style: txt16w4,),
                    ));
                })),
          ],
        ),
      ),
    );
  }
}


