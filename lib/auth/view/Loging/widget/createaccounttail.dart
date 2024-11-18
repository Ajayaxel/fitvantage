
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateAccountTail extends StatelessWidget {
  String text ="";
   CreateAccountTail({
    required this.text,
    
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 20, top: 3.3),
      decoration: const BoxDecoration(
          color: Color(0xffF2F4F7),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: TextFormField(
        // controller: passwordController,
        decoration:  InputDecoration(
          border: InputBorder.none,
          // suffixIcon: Icon(Icons.visibility),
          hintText: text,
          hintStyle: const TextStyle(fontSize: 16, color: Color(0xff667085)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Email';
          }
          return null;
        },
      ),
    );
  }
}
