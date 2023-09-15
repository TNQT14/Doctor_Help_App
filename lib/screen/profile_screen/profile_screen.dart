import 'package:doctor_help_app/VM/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../containts/containts.dart';
import '../../../model/user/doctor_model.dart';
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
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 75.h, left: 24.w),
              child: Text('My Profile', style: txt32w7,),
            ),
            profileCard(user1, (){
              showDialog(context: context, builder: (context){
                return alertDialog(context);
              });
            }, context),
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
    content: Text('Log out of your account?', style: txt16w4,),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel', style: txt16w4,)),
          TextButton(onPressed: ()=>  AuthService().logoutService(context), child: Text('Logout', style: txt16w4!.copyWith(color: Colors.red),)),
        ],
      )
    ],
  );
}