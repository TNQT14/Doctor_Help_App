import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/VM/service/user_responsitory.dart';
import 'package:doctor_help_app/bloc/doctor/doctor_cubit.dart';
import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/data/data_source/doctor_firestore_service.dart';
import 'package:doctor_help_app/model/user/doctor_model.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/appbar_chat.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.name, required this.imageUrl}) : super(key: key);
  static String routeName = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  String name;
  String imageUrl;
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController mess = TextEditingController();

  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  @override
  void initState() {
   BlocProvider.of<DoctorCubit>(context).getListDataDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>unfocusKeyboard(),
      child: Scaffold(
        backgroundColor: colorbg,
        body: SafeArea(
          child: BlocBuilder<DoctorCubit, DoctorState>(
  builder: (context, state) {
    if(state is DoctorSuccess){
      return Column(
        children: [
          appBarChat(context, widget.imageUrl, widget.name),
          Expanded(child: SingleChildScrollView(
            child: Container(),
          )),
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      spreadRadius: 2
                  )
                ]
            ),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(iconFile),
                ),
                SizedBox(
                  width: 248.w,
                  child: InputTextField(text: mess, hintext: 'Type Message'),
                ),
                InkWell(
                  onTap: (){
                    UserResponsitory().getUserDetail();
                    // print(test);
                  },
                  child: SvgPicture.asset(iconMic),
                ),
              ],
            ),
          )
        ],
      );
    }
    return Center(child:  CircularProgressIndicator(),);
  },
),
        ),
      ),
    );
  }
}

Widget MessageUI(){
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('User').snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text('Error');
        }
        if(snapshot.hasError){
          return Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs.map<Widget>((doc)=>_buildItemDoc(doc)).toList(),
        );
      });
}

_buildItemDoc(DocumentSnapshot doc){
  Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
  if(FirebaseAuth.instance.currentUser!.email != data['email']){
    return ListTile(
      title: data['email'],
      onTap: (){},
    );
  }
}


