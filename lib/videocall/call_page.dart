import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/videocall/videocallconst/constance.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final userId = Random().nextInt(999);


class CallPage extends StatelessWidget {
  final String callID;
  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
    appID:Appinfo.appID, 
    appSign: Appinfo.appSignin,
    callID: callID, 
    userID: userId.toString(), 
    userName: 'userName$userId',
    config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
    );
  }
}
