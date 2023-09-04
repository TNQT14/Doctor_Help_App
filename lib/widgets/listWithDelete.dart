import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/show_toast_messes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../containts/containts.dart';
import 'clipRRectAvatar.dart';

///name: phải truyền vào dưới dạng list

Expanded listMess(UserSuccess state) {
  return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 0,
                color: Colors.grey,
              ),
          padding: EdgeInsetsDirectional.zero,
          itemCount: state.listUser.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              child: cardMess(context, state.listUser[index].email ?? 'Lỗi',
                  state.listUser[index].imageUrl ?? imageCale, user1.description),
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

// String text = 'Hello, can i help you?';
// List <int> ten = List<int>.generate(10, (index) => index);

InkWell cardMess(BuildContext context, String name, String image, String text) {
  return InkWell(
    onTap: () => Navigator.pushNamed(context, ChatScreen.routeName),
    child: Padding(
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
                    (text.length > 23) ? '${text.substring(0, 15)}...' : text,
                    style: txt14w4,
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child:
                Text('12:54 PM', style: txt12w5!.copyWith(color: Colors.grey)),
          )
        ],
      ),
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
