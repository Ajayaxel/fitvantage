import 'package:flutter/material.dart';

import 'package:my_app/onbord/onbordcontent_model.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          OnbordContent(),
        ],
      ),
    );
  }
}
