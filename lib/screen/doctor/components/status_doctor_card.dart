

import 'dart:math';

import 'package:doctor_help_app/containts/add_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/add_style.dart';
import '../../../widgets/clipRRectAvatar.dart';
import '../../../widgets/ratingStar.dart';

Widget statusDoctorCard(
    BuildContext context,
    String image,
    double rating,
    String name,
    String job,
    bool isStatus
    ) {
  var random = Random();
  isStatus = random.nextBool();

  return Container(
    width: MediaQuery.of(context).size.width,
    height: 112,
    margin: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
          child: Row(
            children: <Widget>[
              clipRRectAvatar(64, 96, image),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      name,
                      style: txt16w6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(job,
                        style: txt14w6.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400)),
                  ),
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: isStatus == true ?
                          colorOnlineStatus: colorOfflineStatus,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                        child: isStatus == true ?
                        Text("Online",
                            style: txt12w4.
                              copyWith(color: colorCardTitleWhite)):
                        Text("Offline",
                            style: txt12w4.
                            copyWith(color: colorOfflineTile)),
                      ),
                      const SizedBox(width: 16),
                      ratingStar(rating),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
  );
}