
import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            const SizedBox(height: 80),

            // Email Icon
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF3CC),
                ),
                child: Center(
                  child: Image.asset('assets/Sports/message_4885747 1.png', fit: BoxFit.cover,height: 60,),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Title
            const Text(
              'Verify Your Email to Proceed',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),

            const Spacer(),

            Constbutton(
              text: "Verify",
              onTap: () {},
            ),
            const SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
