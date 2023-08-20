import 'package:doctor_help_app/widgets/clipRRectAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/containerCardDoc.dart';

Container BackGroundEditAvatCard(BuildContext context,
    String image
    ) {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 13),
    // height: 147,
    // width: MediaQuery.of(context).size.width,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: 121,
          width: 121,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              width: 5.0,
              color: Colors.white,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              clipRRectAvatar(121, 121, image),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Icon(CupertinoIcons.pencil_slash),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
