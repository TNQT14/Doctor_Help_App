import 'package:doctor_help_app/VM/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
import '../../bloc/user/user_bloc_cubit.dart';
import 'component/backgroundEditAvataCard.dart';
import 'component/optionProfile.dart';
import 'component/profileCard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String routeName = 'ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    UserBlocCubit.get(context).getUserDataDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      // appBar: AppBar(
      //   title: Text('My Profile',
      //   style: txt32w7AppBar,
      //   ),
      //   elevation: 0.0,
      //   backgroundColor: colorbg,
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 75.h, left: 24.w),
              child: Text(
                'My Profile',
                style: txt32w7,
              ),
            ),
            BlocBuilder<UserBlocCubit, UserBlocState>(
              builder: (context, state) {
                return Card(
                    child: Row(
                  children: [
                    state is UserSuccess
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.h, horizontal: 24.w),
                                child: Row(
                                  children: [
                                    BackGroundEditAvatCard(
                                            context: context,
                                            image: state.user.imageUrl ??
                                                imagePersion,
                                            width: 56.w,
                                            height: 56.h,
                                            paddingTop: 0)
                                        .paddingOnly(right: 16.w),
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(24.0, 24.0, 16.0, 24.0),
                                    //   child: clipRRectAvatar(56, 56, user.imageUrl??imagePersion),
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          "Hello",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: colorCardTitle,
                                          ),
                                        ),
                                        Text(
                                          state.user.name ?? 'Chưa có dữ liệu',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: colorTitle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 104,
                            width: 56,
                            child: Center(
                              child: CircularProgressIndicator(),
                            )),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.logout))
                  ],
                ));

                // return profileCard(state.user, (){
                //   showDialog(context: context, builder: (context){
                //     return alertDialog(context);
                //   });
                // }, context);
                // if (state is UserSuccess) {
                //   return profileCard(state.user, (){
                //     showDialog(context: context, builder: (context){
                //       return alertDialog(context);
                //     });
                //   }, context);
                // }
                // return Center(
                //   child: CircularProgressIndicator(),
                // );
              },
            ),
            // profileCard(user1, (){
            //   showDialog(context: context, builder: (context){
            //     return alertDialog(context);
            //   });
            // }, context),
            SizedBox(height: 16.h),
            optionProfile(context, user1),
          ],
        ),
      ),
      // bottomNavigationBar: BottomMenu(),
    );
  }
}

AlertDialog alertDialog(BuildContext context) {
  return AlertDialog(
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    title: const Text('Warning'),
    content: Text(
      'Log out of your account?',
      style: txt16w4,
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: txt16w4,
              )),
          TextButton(
              onPressed: () => AuthService().logoutService(context),
              child: Text(
                'Logout',
                style: txt16w4!.copyWith(color: Colors.red),
              )),
        ],
      )
    ],
  );
}
