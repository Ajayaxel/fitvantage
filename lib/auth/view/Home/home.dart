import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/auth/view/Loging/login_er_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 82, 246),
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home page",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
               Get.to(LoginErPage());
            },
            child: Center(
              child: Text("Logout",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
            ),
          )
        ],
      ) 
      ),
    );
  }
}