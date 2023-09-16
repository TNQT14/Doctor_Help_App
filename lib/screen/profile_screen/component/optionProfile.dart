import 'package:doctor_help_app/containts/add_color.dart';
import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/screen/profile_screen/about_screen/about_screen.dart';
import 'package:doctor_help_app/screen/profile_screen/security_screen/security_screen.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../containts/add_images.dart';
import '../../../../model/user/doctor_model.dart';
import '../notification_screen/notification_screen.dart';
import '../personal_data_screen/personal_data_screen.dart';

_buildOption(String image, String title, Function()? onTap){
  return ListTile(
    leading: Container(
      width: 22,
        height: 22,
        child: Image.asset(image)
    ),
    title: Text(
      title,
      style: txt16w4
    ),
    onTap: onTap,
  );
}

_title(String title){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
    child: Text(title,
            style: txt18w6,
    ),
  );
}

Widget optionProfile(BuildContext context, DoctorModel user){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title("Personal"),
        Container(
          child: Column(
            children: <Widget>[
              _buildOption(iconProfile ,"Account", () {}),
              _buildOption(iconPaper,
                  "Personal Data", ()=>
                    Navigator.pushNamed(context, PersonalDataScreen.routeName)
                  ),
            ],
          ),
        ),
        _title("General"),
        Container(
          child: Column(
            children: <Widget>[
              _buildOption(iconNotification,
                  "Notification", () =>Navigator.pushNamed(context,
                      NotificationScreen.routeName)),
              _buildOption(iconShield,
                  "Security", () => Navigator.pushNamed(context, SecurityScreen.routeName)),
              _buildOption(iconGlobal,
                  "Language", () =>Navigator.pushNamed(context, LanguageScreen.routeName)),
              _buildOption(iconInfoCircle,
                  "Help", () {}),
              _buildOption(iconInfoSquare,
                  "About", () =>Navigator.pushNamed(context, AboutScreen.routeName)),
            ],
          ),
        ),
      ],
    ),
  );
}