import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class QuestionSelctedBox extends StatelessWidget {
  String text = "";
  final bool status;

  final Function()? onTap;

  QuestionSelctedBox({
    super.key,
    required this.text,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Flexible(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
           height: 56,
          // width: 327,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              border: status ? Border.all(color: const Color(0xff7FFA88)) : null,
              color: status ? const Color(0xff7FFA88) : const Color(0xff24262B)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  text,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.2),
                      border: status
                          ? Border.all(color: const Color(0x000000ff))
                          : Border.all(color: const Color(0xffffffff)),
                      color: status ? const Color(0x00000000) : const Color(0xff24262B)),
                  child: status
                      ? SvgPicture.asset(
                          "assets/setup/Vector (2).svg",
                          fit: BoxFit.cover,
                        )
                      : null),
            ],
          ),
        ),
      ),
    );
  }
}
