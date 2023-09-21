import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_help_app/bloc/doctor/doctor_cubit.dart';
import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/model/user/customer_of_doc_model.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/model/user/user_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../bloc/user/user_bloc_cubit.dart';
import '../../../widgets/widgets.dart';
import '../../appointment_screen/appointment_dateTime_screen.dart';
import '../../home_screen/components/doctorCard.dart';
import 'components/pro5DocDetail.dart';
import 'components/rowDocDetailIn4.dart';

class DoctordetailScreen extends StatefulWidget {
  DoctordetailScreen({
    Key? key,
    required this.docDetail,
    // required this.userModel
    // required this.doc_detail,
    // required this.doc_job,
    // required this.doc_name,
    // required this.doc_imageUrl
  }) : super(key: key);
  static String routeName = 'DoctordetailScreen';

  DoctorModel docDetail;

  @override
  State<DoctordetailScreen> createState() => _DoctordetailScreenState();
}

class _DoctordetailScreenState extends State<DoctordetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    DoctorCubit.get(context).getListCustomer();
    super.initState();
  }

  // UserModel userModel;
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
                      widget.docDetail.imageUrl ?? imagePersion,
                      widget.docDetail.name ?? 'Không có dữ liệu',
                      widget.docDetail.job ?? 'Không có dữ liệu'),
                ),
                //body
                Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            textTitle('Profile Doctor', isPadding: false),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: TextExpanded(
                                text: widget.docDetail.description,
                              ),
                            ),
                            textTitle('Schedule'),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textTitle('Reviews'),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        fontSize: 17.sp, color: colorKmain),
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<DoctorCubit, DoctorState>(
                              builder: (context, state) {
                                if(state is CustomerSuccess){
                                  List<CustomerOfDocModel> listcustom = state.listcustomer;
                                  return SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                        itemCount: listcustom.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                              child: reviewsCard(
                                                  listcustom[index].imageUrl??imagePersion,
                                                  double.parse(listcustom[index].rating??0.toString()),
                                                  listcustom[index].name??"Chưa có thông tin",
                                                  listcustom[index].job??"Chưa có thông tin",
                                                  listcustom[index].review??"Chưa có thông tin").paddingSymmetric(
                                                  horizontal: 16.w,
                                                  vertical: 16.h));
                                        }),
                                  );
                                }
                                return Center( child: CircularProgressIndicator(),);
                              },
                            )
                            //reviews
                            // BlocBuilder<DoctorCubit, DoctorState>(
                            //   builder: (context, state) {
                            //     if (state is CustomerSuccess) {
                            //       List<CustomerOfDocModel> listcustomer = state.listcustomer;
                            //       return Container(
                            //         height: 300,
                            //         child: ListView.builder(itemBuilder: (context, indext){
                            //           return Container();
                            //         }),
                            //       );
                            //     }
                            //     return Center(
                            //       child: CircularProgressIndicator(),
                            //     );
                            //   },
                            // ),
                            // backgroundDoctorCard(
                            //   context,
                            //   Padding(
                            //     padding:
                            //     EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                            //     child: reviewsCard(user1.imageUrl, user1.rating, user1.name, user1.job, user1.review),
                            //   ),
                            //   // height: 117.h
                            // ),
                          ],
                        ),
                      )),
                ),
                // pro5DocDetail(context, user1.imageUrl, user1.rating,
                //     docDetail.description??'Không có dữ liệu', user1.name, user1.job, user1.review),
                const SizedBox(height: 15)
              ],
            ),
          ),

          //button
          bottomCardButton('Make an appointment', () {
            print('object');
            // Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AppointmentDateTimeScreen(
                        doctorModel: widget.docDetail,
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
