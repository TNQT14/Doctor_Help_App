import 'package:doctor_help_app/bloc/doctor/doctor_cubit.dart';
import 'package:doctor_help_app/screen/chat_screen/test.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/show_toast_messes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../containts/containts.dart';
import '../screen/profile_screen/notification_screen/notification_screen.dart';
import 'clipRRectAvatar.dart';

///name: phải truyền vào dưới dạng list

Expanded listMess(DoctorSuccess state) {
  return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 0,
                color: Colors.grey,
              ),
          padding: EdgeInsetsDirectional.zero,
          itemCount: state.listDoctor.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(imageUrl: state.listDoctor[index].imageUrl,
                            receiverID: state.listDoctor[index].uidDoctor,
                            name: state.listDoctor[index].name,)
                    ),
                  );
                },
                child: cardMess(
                    context,
                    state.listDoctor[index].name ?? 'Lỗi',
                    state.listDoctor[index].imageUrl ?? imagePersion,
                    state.listDoctor[index].description),
              ),
              // child: StreamBuilder<List<types.Room>>(
              //   stream:  FirebaseChatCore.instance.rooms(),
              //   builder: (context, snapshot){
              //     final room = snapshot.data![index];
              //     if(snapshot.hasData){
              //       return
              //         InkWell(
              //           onTap: (){
              //             // Navigator.of(context).push(
              //             //   MaterialPageRoute(
              //             //     builder: (context) => ChatScreenTest(
              //             //       room: room,
              //             //     ),
              //             //   ),
              //             // );
              //           },
              //           child: cardMess(
              //               context,
              //               state.listDoctor[index].name ?? 'Lỗi',
              //               state.listDoctor[index].imageUrl ?? imagePersion,
              //               state.listDoctor[index].description),
              //         );
              //     }
              //     return CircularProgressIndicator();
              //   },
              // ),
              onDismissed: (direction) {
                // showToastMessage(context,'Message Deleted');
                showSnackBar(context, 'Message Deleted');
              },
              secondaryBackground: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                color: colorBgDelete,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      'Delete',
                      style: txt16w4!.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              background: Container(),
            );
          }));

}

// void _handlePressed(UserModel otherUser, BuildContext context) async {
//   final navigator = Navigator.of(context);
//   final room = await FirebaseChatCore.instance.createRoom(otherUser);
//
//   navigator.pop();
//   await navigator.push(
//     MaterialPageRoute(
//       builder: (context) => ChatScreen(
//         room: room,
//       ),
//     ),
//   );
// }

// String text = 'Hello, can i help you?';
// List <int> ten = List<int>.generate(10, (index) => index);

Padding cardMess(
  BuildContext context,
  String name,
  String image,
  String text,
) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            clipRRectAvatar(48, 48, image),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: 200,
                    child: Text(
                      name,
                      style: txt16w6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(
                    text,
                    style: txt14w4,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text('12:54 PM', style: txt12w5!.copyWith(color: Colors.grey)),
        )
      ],
    ),
  );
}



Expanded listNotification(String name, String image, String mess) {
  return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 0,
                color: Colors.grey,
              ),
          padding: EdgeInsetsDirectional.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // showToastMessage(context,'Message Deleted');
                showSnackBar(context, 'Notification Deleted');
              },
              secondaryBackground: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                color: colorBgDelete,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      'Delete',
                      style: txt16w4!.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              background: Container(),
              child: cardNotification(context, name, mess),
            );
          }));
}

InkWell cardNotification(BuildContext context, String name, String text) {
  return InkWell(
    onTap: () => Navigator.pushNamed(context, NotificationScreen.routeName),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.5),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: txt16w6,
                  ),
                ),
                Text(
                  (text.length > 23) ? '${text.substring(0, 25)}...' : text,
                  style: txt14w4,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Text('12:54 PM', style: txt12w5!.copyWith(color: Colors.grey)),
          )
        ],
      ),
    ),
  );
}
