import 'package:doctor_help_app/containts/add_color.dart';
import 'package:doctor_help_app/screen/profile_screen/component/personal_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

_buildOption(Icon icon, String title, VoidCallback onTap){
  return ListTile(
    leading: icon,
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

Widget optionProfile(BuildContext context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title("Personal"),
        Container(
          child: Column(
            children: <Widget>[
              _buildOption(const Icon(Icons.person_outline),"Account", () {}),
              _buildOption(const Icon(CupertinoIcons.doc_text),
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
              _buildOption(const Icon(CupertinoIcons.bell),
                  "Notification", () {}),
              _buildOption(const Icon(CupertinoIcons.checkmark_shield),
                  "Security", () {}),
              _buildOption(const Icon(CupertinoIcons.exclamationmark_circle),
                  "Help", () {}),
              _buildOption(const Icon(CupertinoIcons.info_circle),
                  "About", () {}),
            ],
          ),
        ),
      ],
    ),
  );
}