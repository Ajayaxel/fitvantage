
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class QuestionsOptionsbox extends StatelessWidget {
    String text="";
 final bool status;

  final Function()? onTap;

   QuestionsOptionsbox({
    
    super.key,
    required this.text, required this.status, this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 327,
        padding: const EdgeInsets.only(
          left: 22,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:status? Border.all(color:  const Color(0xff7FFA88)):null,
            color: const Color(0xffFFFFFF).withOpacity(0.3)),
        child: Row(
          children: [
          Container(
            padding: const EdgeInsets.only(top: 5),
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.2),
              border: Border.all(color: Colors.white),
              color:status? const Color(0xff2DC38C): const Color(0xffFFFFFF).withOpacity(0.3)),
             child:status? SvgPicture.asset("assets/setup/tic.svg",fit: BoxFit.cover,):null
          ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
