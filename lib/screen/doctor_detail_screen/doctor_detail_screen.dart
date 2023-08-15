import 'package:doctor_help_app/containts/containts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/widgets.dart';
import 'components/pro5DocDetail.dart';
import 'components/rowDocDetailIn4.dart';

class DoctordetailScreen extends StatelessWidget {
  const DoctordetailScreen({Key? key}) : super(key: key);
  static String routeName = 'DoctordetailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      backgroundColor: colorF9f9fe,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 16),
                child: rowDocDetailIn4(),
              ),
              pro5DocDetail(context)
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottomCardButton(),
          )
        ],
      ),
    );
  }
}



String txt = 'From commuter to operational, hobby to heavy duty tasks,'
    ' Dr. Detail provides expert detailing service and cosmetic care for any motorized vehicle.'
    '  Whether it’s an exterior hand wash to full cleaning and detailing, exterior polishing and waxing,'
    ' full interior shampoo & cleaning, addressing the dashboard and door panels, and cleaning glass,'
    ' inside and out, paint touch-ups, and more, Dr. Detail offers excellence in service.';




