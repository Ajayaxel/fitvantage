
import 'package:flutter/material.dart';

class ProgramCards extends StatelessWidget {
  String image;
  String title;
  String subtitle;
   ProgramCards({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.all(16),
     padding: const EdgeInsets.all(10),
     height: 142,
     width: double.infinity,
     decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage(image),
         fit: BoxFit.cover,
       )
     ),
     child:  Column(
       mainAxisAlignment: MainAxisAlignment.end,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(title,
         style: const TextStyle(
           color: Colors.white,
           fontSize: 18,
           fontWeight: FontWeight.w500,
         )),
         Text(subtitle,
         style: const TextStyle(
           color: Colors.white,
           fontSize: 10,
         ))
       ],
     ),
    );
  }
}
