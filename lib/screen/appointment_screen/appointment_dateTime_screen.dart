import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/screen/home_screen/components/doctorCard.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../containts/containts.dart';
import 'appointment_summary_screen.dart';

class AppointmentDateTimeScreen extends StatefulWidget {
  AppointmentDateTimeScreen({Key? key, required this.doctorModel
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

  @override
  State<AppointmentDateTimeScreen> createState() =>
      _AppointmentDateTimeScreenState();
}

class _AppointmentDateTimeScreenState extends State<AppointmentDateTimeScreen> {
  int? isClick;
  int? isClickMonth;
  int? isClickday;
  //
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
                    name: widget.doctorModel.name ?? 'Không có dữ liệu',
                    job: widget.doctorModel.job ?? 'Không có dữ liệu',
                    image_doc: widget.doctorModel.imageUrl ?? imagePersion),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: textTitle('Date & Time'),
                ),
                Container(
                  height: 33,
                  margin: EdgeInsets.only(bottom: 16.h, top: 8.h),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            width: 8.w,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: daymodel.month.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isClickMonth = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 57,
                            height: 33,
                            decoration: BoxDecoration(
                              color: (isClickMonth == index)
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: (isClickMonth == index)
                                      ? colorKmain
                                      : Colors.transparent),
                            ),
                            child: Text(
                              daymodel.month[index],
                              style: txt14w6!.copyWith(
                                  color: (isClickMonth == index)
                                      ? colorKmain
                                      : Colors.grey),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  // width: double.infinity,
                  height: 75.h,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: daymodel.listSchedule.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildContainer(index, onTap: (){setState(() {
                          isClickday = index;
                        });});
                      }),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                    primary: false,
                    itemCount: time.length,
                    // crossAxisSpacing: 10,
                    // mainAxisSpacing: 10,
                    // crossAxisCount: 2,
                    itemBuilder: (context, intdex) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isClick = intdex;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          alignment: Alignment.center,
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: (isClick == intdex)
                                  ? colorKmain
                                  : Colors.white),
                          child: Text(
                            time[intdex],
                            style: txt12w5!.copyWith(
                                color: (isClick == intdex)
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 11.w,
                        mainAxisSpacing: 11.h,
                        crossAxisCount: 2,
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
                                doctorModel: widget.doctorModel,
                              )),
                    )
                  })
        ],
      ),
    );
  }

  Widget buildContainer(int index, {required Function() onTap}) {
    return GestureDetector(
      onTap: (daymodel.listSchedule[index].schedule == 'yes')? onTap: (){},
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 0 : 7.w),
        alignment: Alignment.center,
        width: 43.72.w,
        // height: 75.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: (daymodel.listSchedule[index].schedule == 'yes')
                  ? ((isClickday == index)? colorKmain: Colors.grey.shade300)
                  : Colors.transparent),
          color: (daymodel.listSchedule[index].schedule == 'yes')
              ? Colors.white
              : Color(0xffEBF1F9),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              daymodel.week[index],
              style: txt12w4!.copyWith(color: Colors.grey),
            ),
            Text(
              daymodel.listSchedule[index].day.toString(),
              style: txt15w6!.copyWith(
                  color: (daymodel.listSchedule[index].schedule == 'yes')
                      ? colorKmain
                      : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

List<String> time = ['10.30 - 12.00', '15.00 - 17.00'];

//card thông tin doctor
Padding doctorDateTimeAppointmentCard(BuildContext context,
    {required String name, required String job, required String image_doc}) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0.h),
    child: backgroundDoctorCard(
      context,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.0.w),
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
