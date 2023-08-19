import 'package:doctor_help_app/widgets/clipRRectAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/containerCardDoc.dart';

Container BackGroundEditAvatCard(BuildContext context,
    String image
    ) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13),
    height: 147,
    width: MediaQuery.of(context).size.width,
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
            children: [
              clipRRectAvatar(121, 121, image),
              Icon(Icons.edit),
            ],
          ),
        ),
      ],
    ),
  );
}
