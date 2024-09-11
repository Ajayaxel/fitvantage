import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Center(child: Text("Login successfully")),
           const SizedBox(height: 14,),
           GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
             child: Container(
              height: 40,
              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(18)),
              child: Center(child: Text("Sign Out", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),))),
           )
          ],
        ),
      ),
    ));
  }
}