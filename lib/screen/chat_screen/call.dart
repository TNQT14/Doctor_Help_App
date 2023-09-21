import 'package:doctor_help_app/model/call_model.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID, required this.userName, required this.userId}) : super(key: key);
  final String callID;
  final String userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: CallModel.appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: CallModel.yourAppSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId??'Na6wNyUZZTRsfXmYWzB1',
      userName: userName??"Lỗi",
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}