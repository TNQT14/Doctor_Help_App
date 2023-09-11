import 'package:card_swiper/card_swiper.dart';
import 'package:doctor_help_app/bloc/doctor/doctor_cubit.dart';
import 'package:doctor_help_app/bloc/user/user_bloc_cubit.dart';
import 'package:doctor_help_app/model/disease/disease_model.dart';
import 'package:doctor_help_app/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../containts/containts.dart';
import '../../model/user/doctor_model.dart';
import '../../widgets/widgets.dart';
import 'components/doctorCard.dart';
import 'components/rowIn4.dart';
import 'components/shadowSlideCard.dart';
import 'components/listDisease.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();
  List<DoctorModel> listDoctor = [];

  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getListDataDoctor();
    UserBlocCubit.get(context).getUserDataDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusKeyboard(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colorbg,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //get user detail data
              BlocBuilder<UserBlocCubit, UserBlocState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 20.h, bottom: 20.h),
                      child: rowIn4(state.user.imageUrl??imagePersion),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0.w, right: 15.w, bottom: 8.h),
                child: InputTextField(
                    hintext: 'Search',
                    text: search,
                    isPrefix: true,
                    image: iconSearch),
              ),
              BlocConsumer<DoctorCubit, DoctorState>(
                listener: (context, state) {
                  if (state is DoctorSuccess) {
                    listDoctor = state.listDoctor;
                  }
                },
                builder: (context, state) {
                  bool isLoading = false;
                  if (state is DoctorLoading) {
                    isLoading = state.isLoading;
                  }
                  // if (state is DoctorSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0.w),
                                child: textTitle('My Appointment'),
                              ),
                              if (isLoading)
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              if (!isLoading)
                                Swiper(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return containerCardDoc(
                                        context,
                                        listDoctor[index].imageUrl,
                                        listDoctor[index].name,
                                        listDoctor[index].job,
                                        trailing: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                DoctordetailScreen.routeName);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            width: 40.w,
                                            height: 40.h,
                                            child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: colorKmain,
                                                size: 18),
                                          ),
                                        ));
                                  },
                                  itemCount: listDoctor.length,
                                  itemWidth: double.infinity,
                                  itemHeight: 131.0.h,
                                  layout: SwiperLayout.TINDER,
                                )
                              // shadowSlideCard(
                              //     context, user1.imageUrl, user1.name, user1.job),
                            ],
                          ),
                          titleListNearDoc(),
                          if (isLoading)
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          if (!isLoading)
                            Container(
                              height: 124.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listDoctor.length,
                                  itemBuilder: (context, index) {
                                    return doctorCard(
                                        context,
                                        listDoctor[index].imageUrl,
                                        listDoctor[index].rating,
                                        listDoctor[index].name,
                                        listDoctor[index].job);
                                  }),
                            ),
                          SizedBox(
                            height: 16.h,
                          ),
                          listDisease()
                        ],
                      ),
                    ),
                  );
                  //}
                  // return Center(
                  //   child: CircularProgressIndicator(),
                  // );
                },
              )
            ],
          ),
          // bottomNavigationBar: BottomMenu(),
        ),
      ),
    );
  }
}

Padding titleListNearDoc() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textTitle('Nearby Doctor'),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See All',
            style: TextStyle(fontSize: 17.sp, color: colorKmain),
          ),
        )
      ],
    ),
  );
}
