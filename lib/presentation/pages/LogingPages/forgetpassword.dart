import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // dark background
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "Forget Password",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
            // Lock icon in center
            Center(
              child: Image.asset(
                'assets/loging/Group 1000004664.png',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),

 
            const SizedBox(height: 40),
            const Text(
              "Lorem ipsum dolor sit amet consectetur.\nDui tristique erat",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),

            // Email Field
            _buildInputField(
              icon: Icons.email_outlined,
              hint: "Enter your email Address",
            ),
            const SizedBox(height: 20),

            // Mobile Field
            _buildInputField(
              icon: Icons.phone_outlined,
              hint: "Enter your mobile number",
            ),
            const Spacer(),

            // Send button
            Constbutton(onTap: () {}, text: "send")
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white),
        ),
        child: TextField(
          obscureText: true,
          style: const TextStyle(
            fontFamily: "Lufga",
            fontSize: 16,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: "Lufga",
              color: Colors.white54,
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
      ),
    );
  }
}
