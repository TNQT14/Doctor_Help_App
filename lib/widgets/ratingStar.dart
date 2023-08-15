import 'package:flutter/material.dart';

import '../containts/containts.dart';

Row ratingStar() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          Icon(
            Icons.star,
            color: colorF1c644,
          ),
          Text(
            '4.5',
            style: txt14w6!.copyWith(
                fontWeight: FontWeight.w400, color: Colors.grey.shade400),
          ),
        ],
      )
    ],
  );
}