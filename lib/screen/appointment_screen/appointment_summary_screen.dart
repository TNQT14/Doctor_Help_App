import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointment_success_screen.dart';
import 'components/cardDateTime.dart';
import 'give_screen/give_screen.dart';

class AppointmentSummaryScreen extends StatelessWidget {
  String? appBarTitle;
  String? bottomTitle;
  AppointmentSummaryScreen({Key? key,
    required String appBarTitle,
    required String bottomTitle}): super(key: key){
    this.appBarTitle = appBarTitle;
    this.bottomTitle = bottomTitle;
  }
  static String routeNameSummary = 'AppointmentSummaryScreen';
  static String routeNameDetail = 'AppointmentDetailScreen';


  @override
  Widget build(BuildContext context) {
    String nonTitle = "Thiếu param";
    return Scaffold(
      appBar: appbarCustom(context,
          title: Text(
            appBarTitle ?? nonTitle,
            style: txt16w6!.copyWith(color: Colors.black),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textTitle('Consultation Schedule'),
                  cardDateTime(),
                  textTitle('Doctor Information'),
                  doctorContactCard(
                    context,
                    user1.imageUrl,
                    user1.name,
                    user1.job,
                    chat: true,
                  ),
                  textTitle('Patient Information'),
                  doctorContactCard(context, user1.imageUrl,  user1.name,  user1.job),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )),
          bottomTitle == "Give Your Reviews"
              ? bottomCardButton(
            bottomTitle ?? nonTitle,
                () => Navigator.pushNamed(context, GiveReviewScreen.routeName),
          )
              : bottomCardButton(
            bottomTitle ?? nonTitle,
                () => Navigator.pushNamed(context, AppointmentSuccessScreen.routeName),
          )

        ],
      ),
    );
  }
}

Container doctorContactCard(BuildContext context, String image, String name, String job,
    {bool chat = false}) {
  return backgroundDoctorCard(
      context,
      Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     clipRRectAvatar(56, 56, image),
            //     SizedBox(
            //       width: 16.w,
            //     ),
            //     Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //          name,
            //           style: txt16w6,
            //         ),
            //         Text(
            //           job,
            //           style: txt14w4,
            //         )
            //       ],
            //     ),
            //     Spacer(),
            //     chat
            //         ? GestureDetector(
            //             onTap: () {},
            //             child: SizedBox(
            //               width: 25.w,
            //               height: 25.h,
            //               child: Image.asset(
            //                 iconChat,
            //                 color: colorKmain,
            //               ),
            //             ),
            //           )
            //         : SizedBox()
            //   ],
            // ),
            ListTile(
              trailing: chat? GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, ChatScreen.routeName),
                child:
                //Icon(CupertinoIcons.chat_bubble_text, color: Colors.blue,)
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  width: 25.w, height: 25.h, child: Image.asset(iconChat, color: colorKmain,),),
              ) : SizedBox(),
              title: Text(user1.name, style: txt16w6,),
              subtitle: Text(user1.job, style: txt14w4,),
              contentPadding: EdgeInsetsDirectional.zero,
              leading: clipRRectAvatar(56, 56, user1.imageUrl),
              onTap: ()=>Navigator.pushNamed(context, GiveReviewScreen.routeName),
            ),
            Divider(
              thickness: 1,
              height: 0,
            ),
            iconIn4(Icons.phone, Colors.blue, 'Phone', user1.phone),
            iconIn4(Icons.mail, Colors.red, 'Email', user1.email)
          ],
        ),
      ),
      height: 222.h);
}
