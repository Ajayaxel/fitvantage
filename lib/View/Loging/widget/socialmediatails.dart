
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SocialmediaButton extends StatelessWidget {
  String text ="";
  void Function()? onPressed;
 SocialmediaButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
            backgroundColor: const Color(0xffFFFFFF),
            side: const BorderSide(
              width: 1,
              color: Color(0xffD0D5DD),
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 78,right: 78),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset("assets/loging/gallery.svg"),
              Text(
                "$text",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.normal,
                  color: const Color(0xff101828),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
