import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../containts/containts.dart';
import 'appointment_summary_screen.dart';

class AppointmentDateTimeScreen extends StatelessWidget {
  AppointmentDateTimeScreen(
      {Key? key,
        required this.doctorModel
      // required this.doc_job,
      // required this.doc_name,
      // required this.doc_image,
      // required this.doc_rate,
      // required this.doc_phone,
      // required this.doc_email
      })
      : super(key: key);
  static String routeName = 'AppointmentDateTimeScreen';
  DoctorModel doctorModel;
  //
  // String doc_name;
  // String doc_job;
  // String doc_image;
  // String doc_email;
  // var doc_phone;
  // var doc_rate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      appBar: appbarCustom(context),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doctorDateTimeAppointmentCard(context,
                    name: doctorModel.name ?? 'Không có dữ liệu',
                    job: doctorModel.job ?? 'Không có dữ liệu',
                    image_doc: doctorModel.imageUrl ?? imagePersion),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: textTitle('Date & Time'),
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.white,
                  selectedTextColor: colorKmain,
                  onDateChange: (date) {
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                    // });
                  },
                  height: 90,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                    primary: false,
                    itemCount: 3,
                    // crossAxisSpacing: 10,
                    // mainAxisSpacing: 10,
                    // crossAxisCount: 2,
                    itemBuilder: (context, intdex){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                        alignment: Alignment.center,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: colorKmain
                        ),
                        child:  Text("set time", style: txt12w5!.copyWith(color: Colors.white),),
                      );
                    }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 11.w,
                    mainAxisSpacing: 11.h,
                      crossAxisCount:  2,
                  childAspectRatio: (4.5)),
                  ),
                )
              ],
            ),
          )),
          bottomCardButton(
              'Next',
              () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentSummaryScreen(
                                appBarTitle: "Summary",
                                bottomTitle: 'Make my appointment',
                            doctorModel: doctorModel,
                              )),
                    )
                  })
        ],
      ),
    );
  }
}

//card thông tin doctor
Padding doctorDateTimeAppointmentCard(BuildContext context,
    {required String name, required String job, required String image_doc}) {
  return Padding(
    padding:  EdgeInsets.only(top: 8.0.h),
    child: backgroundDoctorCard(
      context,
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: 16.0.w),
              child: clipRRectAvatar(56, 84, image_doc),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: txt18w7,
                ),
                Text(
                  job,
                  style: txt14w5!.copyWith(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
      // height: 100.h,
    ),
  );
}
