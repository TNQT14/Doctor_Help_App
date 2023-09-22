import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/data/data_source/doctor_firestore_service.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/model/user/user_model.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../bloc/user/user_bloc_cubit.dart';
import 'appointment_success_screen.dart';
import 'components/cardDateTime.dart';
import 'give_screen/give_screen.dart';

class AppointmentSummaryScreen extends StatefulWidget {
  AppointmentSummaryScreen(
      {Key? key,
      required this.appBarTitle,
      required this.bottomTitle,
      required this.month,
      required this.day,
      required this.time,
      required this.doctorModel})
      : super(key: key) {
    // this.appBarTitle = appBarTitle;
    // this.bottomTitle = bottomTitle;
  }
  static String routeNameSummary = 'AppointmentSummaryScreen';
  static String routeNameDetail = 'AppointmentDetailScreen';
  String? appBarTitle;
  String? bottomTitle;
  DoctorModel doctorModel;
  String month;
  String day;
  String time;

  @override
  State<AppointmentSummaryScreen> createState() =>
      _AppointmentSummaryScreenState();
}

class _AppointmentSummaryScreenState extends State<AppointmentSummaryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    UserBlocCubit.get(context).getUserDataDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String nonTitle = "Thiếu param";
    return Scaffold(
      appBar: appbarCustom(context,
          title: Text(
            widget.appBarTitle ?? nonTitle,
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
                    context: context,
                    image: widget.doctorModel.imageUrl,
                    name: widget.doctorModel.name,
                    job: widget.doctorModel.job,
                    phone: widget.doctorModel.phone,
                    email: widget.doctorModel.email,
                    receiverID: widget.doctorModel.uidDoctor,
                    chat: true,
                  ),
                  textTitle('Patient Information'),
                  BlocBuilder<UserBlocCubit, UserBlocState>(
                    builder: (context, state) {
                      if (state is UserSuccess) {
                        UserModel user = state.user;
                        return doctorContactCard(
                            context: context,
                            image: user.imageUrl ?? imagePersion,
                            name: user.name ?? "Chưa có dữ lệu",
                            job: user.job ?? "Chưa có dữ liệu",
                            phone: user.phone ?? 0,
                            email: user.email ?? "Chưa có dữa liệu");
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  // doctorContactCard(
                  //     context: context, image: user1.imageUrl,
                  //     name: user1.name,
                  //     job: user1.job,
                  // phone: user1.phone,
                  // email:  user1.email),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )),
          widget.bottomTitle == "Give Your Reviews"
              ? bottomCardButton(
                  widget.bottomTitle ?? nonTitle,
                  () =>
                      Navigator.pushNamed(context, GiveReviewScreen.routeName),
                )
              : bottomCardButton(
                  widget.bottomTitle ?? nonTitle,
                  () {
                    DoctorFirestoreService().fetchAppointment(
                        name: widget.doctorModel.name,
                        job: widget.doctorModel.job,
                        dateTime: widget.month + '-' + widget.day + '-' + widget.time,
                        uidDoctor: widget.doctorModel.uidDoctor,
                    context: context,
                    doctorModel: widget.doctorModel);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => AppointmentSuccessScreen(
                    //             doctorModel: widget.doctorModel,
                    //           )),
                    // );
                  },
                )
        ],
      ),
    );
  }
}

Container doctorContactCard({
  bool chat = false,
  required BuildContext context,
  required String image,
  required String name,
  required String job,
  required var phone,
  required String email,
  String? receiverID,
  //  required DoctorModel doctorModel,
}) {
  return backgroundDoctorCard(
    context,
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  clipRRectAvatar(56, 56, image ?? imagePersion),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: txt16w6,
                      ),
                      Text(
                        job,
                        style: txt14w4,
                      )
                    ],
                  ).paddingOnly(left: 15.w),
                ],
              ),
              chat
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  name: name,
                                  imageUrl: image,
                                  receiverID: receiverID ?? 'Lỗi')),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5.w),
                        width: 25.w,
                        height: 25.h,
                        child: Image.asset(
                          iconChat,
                          color: colorKmain,
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          // ListTile(
          //   trailing: chat? GestureDetector(
          //     onTap: ()=> Navigator.pushNamed(context, ChatScreen.routeName),
          //     child:
          //     //Icon(CupertinoIcons.chat_bubble_text, color: Colors.blue,)
          //     Container(
          //       margin: EdgeInsets.only(right: 5.w),
          //       width: 25.w, height: 25.h, child: Image.asset(iconChat, color: colorKmain,),),
          //   ) : SizedBox(),
          //   title: Text(user1.name, style: txt16w6,),
          //   subtitle: Text(user1.job, style: txt14w4,),
          //   contentPadding: EdgeInsetsDirectional.zero,
          //   leading: clipRRectAvatar(56, 56, user1.imageUrl),
          //   onTap: ()=>Navigator.pushNamed(context, GiveReviewScreen.routeName),
          // ),
          Divider(
            thickness: 1,
            height: 0,
          ).paddingSymmetric(vertical: 15.h),
          iconIn4(Icons.phone, Colors.blue, 'Phone', phone.toString()),
          iconIn4(Icons.mail, Colors.red, 'Email', email)
        ],
      ),
    ),
    // height: 222.h
  );
}
