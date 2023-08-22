import 'package:doctor_help_app/containts/add_color.dart';
import 'package:flutter/material.dart';

import '../../../../model/user/doctor_model.dart';
import '../../../../widgets/clipRRectAvatar.dart';

Widget profileCard(
    DotorModel user,
    Function()? ontap,
    ){
  return Card(
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 16.0, 24.0),
                  child: clipRRectAvatar(56, 56, user.imageUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Hello",
                    style: TextStyle(
                      fontSize: 16,
                      color: colorCardTitle,
                      ),
                    ),
                    Text(user.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: colorTitle,
                    ),),
                  ],
                ),
              ],
            ),
          ),
          IconButton(onPressed: ontap,
              icon: Icon(Icons.logout))
        ],
      )
    ),
  );
}