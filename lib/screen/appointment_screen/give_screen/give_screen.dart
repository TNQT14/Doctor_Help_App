import 'package:doctor_help_app/containts/add_color.dart';
import 'package:flutter/material.dart';

import '../../../containts/add_style.dart';
import '../../../model/user/doctor_model.dart';
import '../../profile_screen/component/backgroundEditAvataCard.dart';

class GiveReviewScreen extends StatefulWidget {
  const GiveReviewScreen({super.key});
  static String routeName = 'GiveReviewScreen';

  @override
  State<GiveReviewScreen> createState() => _GiveReviewScreenState();
}

class _GiveReviewScreenState extends State<GiveReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbg,
      appBar: AppBar(
        backgroundColor: colorbg,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: BackGroundEditAvatCard(context, user1.imageUrl, false)),
            Center(
              child: Container(
                  width: 296,
                    child: Text('How did  you like the service from the doctor '
                        '${user1.name} as ${user1.job} ?',
                      style: txt16w4,
                      textAlign: TextAlign.center,
                    ),
                  ),
            ),
          ],
        ),
      );
  }
}
