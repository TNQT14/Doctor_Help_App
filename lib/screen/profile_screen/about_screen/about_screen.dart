import 'package:doctor_help_app/containts/add_color.dart';
import 'package:flutter/material.dart';

import '../../../containts/add_style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static String routeName = "AboutScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: colorbg,
          centerTitle: true,
          title: Text("About", style: txt16w6,),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Doctor Help App for Android",
                style: txt32w3,
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Verson",
                    style: txt18w6,
                  ),
                  Text("1.2.2",
                    style: txt18w6,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("Doctor help app là sản phẩm của dự án cuối khóa Devera. Bảo lưu mọi quyền.",
                style: txt18w4,
              ),
              SizedBox(height: 20,),
              Text("Doctor help app dành cho Android là dự án tích hợp bằng phần mềm mở. Được thiết kế hỗ trợ kết nối giữa người dân và bác sĩ nhằm mục đích tư vấn sức khỏe, và đặt lịch khám trực tuyến.",
                style: txt18w4,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
