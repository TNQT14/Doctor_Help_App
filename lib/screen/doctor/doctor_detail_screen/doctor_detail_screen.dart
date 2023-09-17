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
        required this.docDetail
      // required this.doc_detail,
      // required this.doc_job,
      // required this.doc_name,
      // required this.doc_imageUrl
      })
      : super(key: key);
  static String routeName = 'DoctordetailScreen';

  DoctorModel docDetail;

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
                      docDetail.imageUrl ?? imagePersion,
                      docDetail.name ?? 'Không có dữ liệu',
                      docDetail.job ?? 'Không có dữ liệu'
                  ),
                ),
                //body
                pro5DocDetail(context, user1.imageUrl, user1.rating,
                    docDetail.description??'Không có dữ liệu', user1.name, user1.job, user1.review),
                const SizedBox(height: 15)
              ],
            ),
          ),
          bottomCardButton('Make an appointment', () {
            print('object');
            // Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AppointmentDateTimeScreen(
                doctorModel: docDetail,
                // doc_job: docDetail.job??'Không có dữ liệu',
                // doc_name: docDetail.name??'Không có dữ liệu',
                // doc_image: docDetail.imageUrl??imagePersion,
                // doc_rate: docDetail.rating ,
                // doc_phone: docDetail.email,
                // doc_email: docDetail.imageUrl,
              )),
            );
          })
        ],
      ),
    );
  }
}
