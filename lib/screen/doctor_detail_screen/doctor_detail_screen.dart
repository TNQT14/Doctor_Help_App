import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/screen/screens.dart';
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
      backgroundColor: colorbg,
      appBar: appbarCustom(context),
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
            child: bottomCardButton('Make an appointment',
                    (){Navigator.pushNamed(context, AppointmentDateTimeScreen.routeName);}
            ),
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




