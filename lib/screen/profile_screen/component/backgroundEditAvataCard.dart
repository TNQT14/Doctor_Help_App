import 'package:doctor_help_app/widgets/clipRRectAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/containerCardDoc.dart';

Stack BackGroundEditAvatCard(
    {required BuildContext context,
    required String image,
    bool isEdit = false,
    Function()? onTap}) {
  return Stack(
    children: [
      Container(
          margin: EdgeInsets.only(top: 32.h),
          height: 121,
          width: 121,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20,
              )
            ],
            color: Colors.white,
            border: Border.all(
              width: 5.0,
              color: Colors.white,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          )
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(4),
          //     image: DecorationImage(
          //       image: NetworkImage(image),
          //       fit: BoxFit.fill
          //     )
          //   ),
          // ),
          ),
      isEdit
          ? Positioned(
              bottom: 0,
              right: 0,
              // alignment: Alignment.bottomLeft,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(6)),
                    color: Colors.white,
                  ),
                  child: Icon(CupertinoIcons.pencil_slash),
                ),
              ),
            )
          : SizedBox()
    ],
  );
}
