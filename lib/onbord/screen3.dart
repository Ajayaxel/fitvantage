import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/NetworkAuth/networkauth.dart';
import 'package:my_app/onbord/onbordcontent_model.dart';
import 'package:my_app/onbord/screen1.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          OnbordContent(
            showGetStarted: true,
          ),
        ],
      ),
    );
  }
}
