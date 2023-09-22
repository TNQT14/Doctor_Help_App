import 'package:flutter/material.dart';

import '../containts/containts.dart';

ElevatedButton blueElevateButton(Function()? tap, String title,
    {Color color = colorKmain, bool isBlueText = false}) {
  return ElevatedButton(
    onPressed: tap,
    child: Text(
      title,
      style: txt16w5!.copyWith(color: isBlueText ? colorKmain : Colors.white),
    ),
    style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: color),
  );
}

// ElevatedButton whileElevateButton(Function()? tap, String title,
//     {Color color = colorKmain, bool isBlueText = false}) {
//   return ElevatedButton(
//     onPressed: tap,
//     child: Text(
//       title,
//       style: txt16w5!.copyWith(color: isBlueText ? colorKmain : Colors.white),
//     ),
//     style: ElevatedButton.styleFrom(
//         shadowColor: Colors.grey,
//         elevation: 0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//         backgroundColor: color),
//   );
// }
