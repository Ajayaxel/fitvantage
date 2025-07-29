



// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:my_app/presentation/pages/videocall/videocallconst/constance.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// class CallPage extends StatelessWidget {
//   final String callID;
//   final int userId = Random().nextInt(999999);

//   CallPage({Key? key, required this.callID}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCall(
//       appID: Appinfo.appID,
//       appSign: Appinfo.appSignin,
//       callID: callID,
//       userID: userId.toString(),
//       userName: 'user$userId',
//       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//         ..turnOnCameraWhenJoining = true
//         ..turnOnMicrophoneWhenJoining = true,
//     );
//   }
// }
