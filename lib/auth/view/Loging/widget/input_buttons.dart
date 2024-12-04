import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFields extends StatelessWidget {
  final TextEditingController? controller;
  final String input;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const InputFields({
    Key? key,
    required this.input,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 20, top: 18, bottom: 16, right: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          hintText: input,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 16,
            color: const Color(0xff0A0B0A).withOpacity(0.4),
            fontWeight: FontWeight.w500,
          ),
        ),
        validator: validator ?? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $input';
          }
          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}