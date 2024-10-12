import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/onbord/onbordcontent_model.dart';
import 'package:my_app/onbord/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     backgroundColor: Color(0xff7FFA88),
      //  body: 
      //  Column(
      //    children: [
      //         Container(
      //         height: 319.62,
      //         decoration: const BoxDecoration(
      //             image: DecorationImage(
      //           image: AssetImage(
      //             "assets/Onbording/Layer_1.png",
      //           ),
      //           fit: BoxFit.cover,
      //         )),
      //       ),
      //        SizedBox(height: 69.38,),
      //      OnbordContent(),
      //      SizedBox(height: 177)
      //    ],
      //  ),

      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          //   child: Image.asset("assets/Onbording/Aurora background.png",fit: BoxFit.cover,),),
            //  SvgPicture.asset("assets/Onbording/Vector (1).svg"),
        
            // SizedBox(height: 69.38,),
          OnbordContent(),
          //  SizedBox(height: 177)
        ],
      ),
    );
  }
}