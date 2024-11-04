import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonScreen extends StatelessWidget {
  String image;
  String data;
  final void Function()? onPressed;
  ButtonScreen({
    super.key,
    required this.image,
    required this.data,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: 56,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image),
              const SizedBox(width: 8,),
              Flexible(
                child: FittedBox(
                  child: Text(
                    data,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          )),
    );

    // return ElevatedButton.icon(

    //   icon: SvgPicture.asset(
    //    image),
    //   onPressed:onPressed,
    //   label: Expanded(
    //     child: Text(
    //       data,
    //       style: GoogleFonts.montserrat(
    //           color: Colors.black,
    //           fontWeight: FontWeight.w700,
    //           fontSize: 16),
    //     ),
    //   ),
    //   style: ElevatedButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     backgroundColor: Colors.white,
    //     fixedSize: const Size(double.maxFinite, 56),
    //   ),
    // );
  }
}
