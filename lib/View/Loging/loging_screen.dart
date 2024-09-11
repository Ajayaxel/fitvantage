

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Controller/auth.dart';
import 'package:my_app/View/Forgetpassword/forget_pass_screen.dart';
import 'package:my_app/View/Loging/sign_screen.dart';
import 'package:my_app/View/Loging/widget/searchbox_tails.dart';
import 'package:my_app/View/Loging/widget/socialmediatails.dart';
// import 'package:google_fonts/google_fonts.dart';

class LogingScreen extends StatefulWidget {
 const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoding=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 76),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset("assets/loging/Logo.svg")),
              const SizedBox(
                height: 43,
              ),
              Center(
                  child: Text(
                "Welcome Back!",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              )),
              const SizedBox(
                height: 48,
              ),
              // input box section
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      labelText: "user@mail.com",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(
                height: 14,
              ),
              //password input start

              Searchboxtail(passwordController: passwordController),
              //password input end
              const SizedBox(
                height: 14,
              ),
              //signup button start
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xff435A39),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Center(
                    child: Text(
                  "Sign In",
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white),
                )),
              ),
              //signup button End
              const SizedBox(
                height: 14.5,
              ),
              // foregt password sections conatiner start
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xff34BC46),
                    radius: 8,
                    child: SvgPicture.asset(
                      "assets/loging/tic.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Remember me",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff435A39),
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassScreen()));
                    },
                    child: Text(
                      "Forgot password",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff435A39),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              // foregt password sections conatiner start
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      // indent: 20.0,
                      endIndent: 13.0,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 13.0,
                      //  endIndent: 20.0,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              //divder end

              ///google sign sections start
              ///

             isLoding? CircularProgressIndicator() :SocialmediaButton(text: "Continue With Google",onPressed: ()async {
            setState(() {
              isLoding =true;
            });
               await AuthMethods().signInWithGoogle(context);
                  setState(() {
              isLoding =false;
            });
              },),
              const SizedBox(
                height: 8,
              ),
              SocialmediaButton(text: "Continue With Apple",onPressed: () {
                AuthMethods().signInWithApple();
              },),
              const SizedBox(
                height: 8,
              ),
              SocialmediaButton(text: "Continue With FaceBook",onPressed: () {
                
              },),
              // Spacer(),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have account?",
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
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff435A39),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
