import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';

RatingBar ratingBarWidget() {
  return RatingBar.builder(
    itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
      minRating: 0,
      allowHalfRating: true,
      itemSize: 50.w,
      // updateOnDrag: true,
      itemBuilder: (context, _) {
        return Icon(
          Icons.star,
          color: colorF1c644,
        );
      },
      onRatingUpdate: (rating) {});
}
