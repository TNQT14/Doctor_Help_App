import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/widgets.dart';
import '../../appointment_screen/appointment_dateTime_screen.dart';
import 'components/pro5DocDetail.dart';
import 'components/rowDocDetailIn4.dart';

class DoctordetailScreen extends StatelessWidget {
  DoctordetailScreen(
      {Key? key,
      required this.doc_detail,
      required this.doc_job,
      required this.doc_name,
      required this.doc_imageUrl})
      : super(key: key);
  static String routeName = 'DoctordetailScreen';

  String? doc_name;
  String? doc_imageUrl;
  String? doc_job;
  String? doc_detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: colorbg,
      appBar: appbarCustom(context),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //leading
                Padding(
                  padding: EdgeInsets.only(
                      left: 13.w, right: 13.w, top: 16.h, bottom: 8.h),
                  child: rowDocDetailIn4(
                      doc_imageUrl ?? imagePersion,
                      doc_name ?? 'Không có dữ liệu',
                      doc_job ?? 'Không có dữ liệu'),
                ),
                //body
                pro5DocDetail(context, user1.imageUrl, user1.rating,
                    doc_detail??'Không có dữ liệu', user1.name, user1.job, user1.review),
                const SizedBox(height: 15)
              ],
            ),
          ),
          bottomCardButton('Make an appointment', () {
            // Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AppointmentDateTimeScreen(
                doc_job: doc_job,
                doc_name: doc_name,
                doc_image: doc_imageUrl ,
              )),
            );
          })
        ],
      ),
    );
  }
}
