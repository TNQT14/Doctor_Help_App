import 'package:doctor_help_app/containts/add_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../containts/add_style.dart';
import '../../../model/user/doctor_model.dart';
import '../../../widgets/bottomCardButton.dart';
import '../../../widgets/btnOption.dart';
import '../../../widgets/input_textField.dart';
import '../../../widgets/ratingBarWidget.dart';
import '../../user/profile_screen/component/backgroundEditAvataCard.dart';

class GiveReviewScreen extends StatefulWidget {
  const GiveReviewScreen({super.key});
  static String routeName = 'GiveReviewScreen';

  @override
  State<GiveReviewScreen> createState() => _GiveReviewScreenState();
}

class _GiveReviewScreenState extends State<GiveReviewScreen> {
  TextEditingController placholder = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      appBar: AppBar(
        backgroundColor: colorbg,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 40.w, right: 40.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ratingReview(context, user1, placholder),
                const SizedBox(height: 48,),
                personalDoctor(user1),
              ],
            ),
        ),
      ),
      bottomNavigationBar: bottomCardButton('Give Your Reviews', () {}),
      );
  }
}

Widget ratingReview(
    BuildContext context,
    DotorModel doctor,
    TextEditingController placholder,
    ){
  return Container(
    child: Column(
      children: [
        Center(child: BackGroundEditAvatCard(context, user1.imageUrl, false)),
        const SizedBox(height: 24),
        Center(
          child: SizedBox(
              width: 296,
              child: Text.rich(
                TextSpan(
                  text: 'How did you like the service from the doctor ',
                  style: txt16w4,
                  children: <TextSpan>[
                    TextSpan(
                      text: user1.name,
                      style: txt16w6,
                    ),
                    TextSpan(
                      text: ' as ',
                      style: txt16w4,
                    ),
                    TextSpan(
                      text: '${user1.job}',
                      style: txt16w6,
                    ),
                    TextSpan(
                      text: '?',
                      style: txt16w4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
          ),
        ),
        const SizedBox(height: 24),
        Center(child: ratingBarWidget()),
        const SizedBox(height: 24),
        InputTextField(hintext: 'Placeholder', text: placholder),
      ],
    ),
  );
}

Widget personalDoctor(DotorModel doctor){
  return Container(
    child: Column(
      children: <Widget>[
        Center(
          child: Text("Do you want to make him/her as your personal doctoer?",
            style: txt16w4,
            textAlign: TextAlign.center,),
        ),
        const SizedBox(height: 24),
        RadioButtonGroup( option1: 'Yes', option2: 'No, maybe later',
          onChanged: (selectedOption) {
            print('Selected option: $selectedOption');
          },),
      ],
    ),
  );
}
