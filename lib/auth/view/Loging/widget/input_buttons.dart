
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputFileds extends StatelessWidget {
  String input="";
   InputFileds({
  
    super.key,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 56,
   
     // padding: const EdgeInsets.only(left: 20, top: 3.3),
     padding:
         const EdgeInsets.only(left: 20, top: 18, bottom: 16, right: 20),
     decoration: BoxDecoration(
         color: Colors.white.withOpacity(0.6),
         borderRadius: const BorderRadius.all(Radius.circular(12))),
     child: TextFormField(
      
       decoration: InputDecoration(
         border: InputBorder.none,
         // suffixIcon: Icon(Icons.visibility),
         hintText: input,
         hintStyle: GoogleFonts.montserrat(
             fontSize: 16,
             color: const Color(0xff0A0B0A).withOpacity(0.4),
             fontWeight: FontWeight.w500),
       ),
       validator: (value) {
         if (value == null || value.isEmpty) {
           return 'Name';
         }
         return null;
       },
     ),
                    );
  }
}
