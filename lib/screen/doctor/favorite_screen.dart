import 'package:doctor_help_app/bloc/doctor/doctor_cubit.dart';
import 'package:doctor_help_app/screen/doctor/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/add_color.dart';
import '../../containts/add_style.dart';
import '../../model/user/doctor_model.dart';
import 'components/status_doctor_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static String routeName = 'FavoriteScreen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  List<DoctorModel> listDoctor = [];
  @override
  void initState() {
    // TODO: implement initState
    DoctorCubit.get(context).getListDataDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 75.h, left: 24.w),
            child: Text(
              'My Doctor',
              style: txt32w7,
            ),
          ),
          Expanded(
            child: BlocConsumer<DoctorCubit, DoctorState>(
              listener: (context, state) {
                if (state is DoctorSuccess) {
                  listDoctor = state.listDoctor;
                }
              },
              builder: (context, state) {
                if (state is DoctorLoading && state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: listDoctor.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DoctordetailScreen(
                                          docDetail: listDoctor[index]))),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: statusDoctorCard(
                                context,
                                listDoctor[index].imageUrl,
                                listDoctor[index].rating,
                                listDoctor[index].name,
                                listDoctor[index].job,
                                false),
                          ),
                        );
                      }),
                );
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomMenu(),
    );
  }
}
