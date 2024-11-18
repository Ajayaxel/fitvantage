import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardS extends StatelessWidget {
  final bool status;
  String titil = "";
  String subtitile = "";

  final Function()? onTap;
  CardS({
    super.key,
    required this.titil,
    required this.subtitile,
    required this.status, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 169,
          width: 167,
          decoration: BoxDecoration(
              color: status ? const Color(0xff7FFA88) : const Color(0xff24262B),
              borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titil,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Text(
                  subtitile,
                  style: GoogleFonts.montserrat(
                      color: const Color(0xff9EA0A5),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset("assets/setup/leaf.svg",color:status?const Color(0xffffffff):const Color(0xff50535B),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
