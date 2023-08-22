import 'package:doctor_help_app/containts/add_color.dart';
import 'package:doctor_help_app/screen/user/profile_screen/component/personal_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../containts/add_images.dart';
import '../../../../model/user/doctor_model.dart';

_buildOption(String image, String title, Function()? onTap){
  return ListTile(
    leading: Container(
      width: 22,
        height: 22,
        child: Image.asset(image)
    ),
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 16
      ),
    ),
    onTap: onTap,
  );
}

_title(String title){
  return Padding(
    padding: const EdgeInsets.fromLTRB(13, 8, 13, 8),
    child: Text(title,
            style: const TextStyle(
                fontSize: 18,
                color: colorTitle,
              fontWeight: FontWeight.bold,
    ) ,
    ),
  );
}

Widget optionProfile(BuildContext context, DotorModel user){
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
                  "Notification", () {}),
              _buildOption(iconShield,
                  "Security", () {}),
              _buildOption(iconInfoCircle,
                  "Help", () {}),
              _buildOption(iconInfoSquare,
                  "About", () {}),
            ],
          ),
        ),
      ],
    ),
  );
}