import 'package:flutter/material.dart';
import 'package:my_app/onbord/onbordcontent_model.dart';


class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
