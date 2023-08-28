import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';

// String image = imageCale2;
Row rowIn4(String image) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: clipRRectAvatar(54, 54, image),
          title: Text('Current Location', style: txt14w4,),
          subtitle: Text('Enter an address', style: txt16w6!.copyWith(color: Colors.black),),

          ///DropDownButton
        ),
      ),
      InkWell(onTap: (){},
        child: SvgPicture.asset(iconButtonNotification,fit: BoxFit.cover,),)
    ],
  );
}