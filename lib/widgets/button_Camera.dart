import 'package:flutter/material.dart';
Widget button(
    IconData icon,
    Alignment alignment,
    Color colorbg,
    Color color,
    ){
  return Align(
    alignment: alignment,
    child: Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorbg,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2,2),
            blurRadius: 10,
          )
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
        ),
      ),
    ),
  );
}