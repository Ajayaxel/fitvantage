
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/View/Loging/widget/createaccounttail.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 76),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: SvgPicture.asset("assets/loging/Logo.svg")),
              const SizedBox(
                height: 43,
              ),
              Center(
                  child: Text(
                "Create Account",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              )),
              const SizedBox(
                height: 48,
              ),
              CreateAccountTail(
                text: "Full Name",
              ),
              const SizedBox(
                height: 14,
              ),
              CreateAccountTail(
                text: "Email",
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                height: 48,
                padding: const EdgeInsets.only(left: 20, top: 3.3),
                decoration: const BoxDecoration(
                    color: Color(0xffF2F4F7),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextFormField(
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.visibility),
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 16, color: Color(0xff667085)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                height: 48,
                padding: const EdgeInsets.only(left: 20, top: 3.3),
                decoration: const BoxDecoration(
                    color: Color(0xffF2F4F7),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextFormField(
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.visibility),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(fontSize: 16, color: Color(0xff667085)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                  onTap: () {
                      Navigator.pop(context);
                  },
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xff435A39),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Center(
                      child: Text(
                    "Sign up",
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                "By clicking Sign Up, I agree Terms & Conditions andx",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              Text(
                "  Privacy Policy",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 178,
              ),
              GestureDetector(
                onTap:(){
                      Navigator.pop(context);
                } ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Text(
                      "Already have account?",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign In",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff435A39),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
