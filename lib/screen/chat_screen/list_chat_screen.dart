import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/containts.dart';

class ListChatScreen extends StatefulWidget {
  ListChatScreen({Key? key}) : super(key: key);
  static String routeName = 'ListChatScreen';

  @override
  State<ListChatScreen> createState() => _ListChatScreenState();
}

class _ListChatScreenState extends State<ListChatScreen> {
  TextEditingController text = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<UserBlocCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocBuilder<UserBlocCubit, UserBlocState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 75.h, left: 24.w),
                  child: Text(
                    'Messages',
                    style: txt32w7,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 22.0.h, bottom: 11.h),
                          child: InputTextField(
                              hintext: 'Search',
                              text: text,
                              isPrefix: true,
                              image: iconSearch),
                        ),
                        listMess(state),
                        // buildExpanded(state)
                      ],
                    ),
                  ),
                ),
                // bottomCardButton('ok', () => null)
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// Expanded buildExpanded(UserSuccess state) {
//   return Expanded(
//       child: ListView.separated(
//           separatorBuilder: (context, index) => Divider(
//             height: 0,
//             color: Colors.grey,
//           ),
//           padding: EdgeInsetsDirectional.zero,
//           itemCount: state.listUser.length,
//           itemBuilder: (context, index) {
//             return Dismissible(
//               key: UniqueKey(),
//               direction: DismissDirection.endToStart,
//               child: cardMess(
//                   context,
//                   state.listUser[index].name ?? 'Lỗi',
//                   state.listUser[index].imageUrl ??
//                       imageCale,
//                   user1.description),
//               onDismissed: (direction) {
//                 // showToastMessage(context,'Message Deleted');
//                 showSnackBar(context, 'Message Deleted');
//               },
//               secondaryBackground: Container(
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20),
//                 alignment: Alignment.centerRight,
//                 color: colorBgDelete,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.delete_outline,
//                       color: Colors.white,
//                       size: 25,
//                     ),
//                     Text(
//                       'Delete',
//                       style: txt16w4!
//                           .copyWith(color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//               background: Container(),
//             );
//           }));
// }