import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/widgets/show_toast_messes.dart';
import 'package:flutter/material.dart';

import '../containts/containts.dart';
import 'clipRRectAvatar.dart';

///name: phải truyền vào dưới dạng list

Expanded listMess(String name, String image, String mess) {
  return Expanded(child:
  ListView.separated(
      separatorBuilder: (context, index)=>Divider(height: 0, color: Colors.grey,),
      padding: EdgeInsetsDirectional.zero,
      itemCount: 10,
      itemBuilder: (context, index){
        return Dismissible(key: UniqueKey(),
          direction: DismissDirection.endToStart,
          child: cardMess(name, image, mess),
          onDismissed: (direction){
           showToastMessage(context,'Deleted');
          },
          secondaryBackground: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            color: colorBgDelete,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.delete_outline, color: Colors.white, size: 25,),
                Text('Delete', style: txt16w4!.copyWith(color: Colors.white),)
              ],
            ),
          ),
          background: Container(),
        );
      }));
}


// String text = 'Hello, can i help you?';
// List <int> ten = List<int>.generate(10, (index) => index);

Padding cardMess(String name, String image, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.5),
    child: Row(
      children: [
        clipRRectAvatar(48, 48, image),
        SizedBox(width: 15,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(name, style: txt16w6,),
              ),
              Text((text.length>23)? '${ text.substring(0, 25)}...' : text, style: txt14w4,)
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('12:54 PM', style: txt12w5!.copyWith(color: Colors.grey)),)
      ],
    ),
  );
}