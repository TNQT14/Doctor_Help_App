import 'package:doctor_help_app/containts/containts.dart';
import 'package:flutter/material.dart';

AppBar appbarCustom(BuildContext context, {Text? title}) {
  return AppBar(
    backgroundColor: colorbg,
    elevation: 0,
    title: title ?? Text(''),
    centerTitle: true,
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),),
  );
}