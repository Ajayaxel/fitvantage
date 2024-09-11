import 'package:flutter/material.dart';

class Searchboxtail extends StatelessWidget {
  const Searchboxtail({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 20, top: 3.3),
      decoration: const BoxDecoration(
          color: Color(0xffF2F4F7),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(Icons.visibility),
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 16, color: Color(0xff667085)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }
}
