
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ArrowBackButton extends StatelessWidget {
 final double leftPadding;
  const ArrowBackButton({
    super.key,  this.leftPadding=5,
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        
         Navigator.of(context).pop();
      }
      ,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           SizedBox(width: leftPadding,),
          SvgPicture.asset("assets/loging/arrowback.svg"),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Back",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
