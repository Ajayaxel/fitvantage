import 'package:flutter/material.dart';

import 'package:my_app/onbord/onbordcontent_model.dart';

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
