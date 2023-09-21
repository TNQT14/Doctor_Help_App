import 'package:doctor_help_app/screen/chat_screen/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/containts.dart';
import '../../../widgets/widgets.dart';

Container appBarChat({
  required BuildContext context,
  required String image,
  required String name,
  required Function() phone,
  double? top,
}) {
  String roomID = 'test';
  return Container(
    padding: EdgeInsets.only(
      bottom: 5.h,
      top: top??0,
    ),
    alignment: Alignment.bottomCenter,
    // height: 100.h,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.grey.shade300, blurRadius: 10, spreadRadius: 3)
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new_outlined)),
            Padding(
              padding: EdgeInsets.only(left: 5.0.w, right: 16.w),
              child: clipRRectAvatar(36, 36, image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 175,
                  child: Text(
                    name,
                    style: txt16w5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Online',
                  style: txt12w4!.copyWith(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
        // StreamBuilder<List<types.Room>>(
        //   stream: FirebaseChatCore.instance.rooms(),
        //     builder: (context, snapshot){
        //     final room = snapshot.data!;
        //     if(snapshot.hasData){
        //       return IconButton(
        //           onPressed: () {
        //             Navigator.of(context).push(
        //               MaterialPageRoute(
        //                 builder: (context) => ChatScreenTest(
        //                   room: room,
        //                 ),
        //               ),
        //             );
        //           },
        //           icon: Icon(
        //             Icons.phone_rounded,
        //             color: Colors.grey,
        //           ));
        //     }
        //     return CircularProgressIndicator();
        //     },
        Row(
          children: [
            IconButton(
                onPressed: phone,
                icon: Icon(
                  Icons.phone_rounded,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ))
          ],
        )
      ],
    ),
  );
}
