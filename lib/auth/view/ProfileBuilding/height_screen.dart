import 'package:flutter/material.dart';
import 'package:my_app/auth/view/ProfileBuilding/spec_goals_screen.dart';
import 'package:my_app/constsatnce/const_button.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgePickerScreenState createState() => _AgePickerScreenState();
}

class _AgePickerScreenState extends State<HeightScreen> {
  int selectedAge = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0B0A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 87,
              ),
              const Text(
                "Specify height",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontFamily: 'Lufga', // Ensure the Lufga font is added
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            'Lorem ipsum dolor sit amet consectetur.\nDui tristique erat',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lufga',
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 100),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 160,
                child: Container(
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:  const Color(0xff7FFA88),),
                  height: 4,
                  width: 110,
               
                ),
              ),
              Positioned(
                bottom: 160,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:  const Color(0xff7FFA88),),
                  height: 4,
                  width: 110,
                 
                ),
              ),
              SizedBox(
                height: 380,
                child: ListWheelScrollView.useDelegate(
                  controller:
                      FixedExtentScrollController(initialItem: selectedAge),
                  physics: const FixedExtentScrollPhysics(),
                  itemExtent: 70,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: Text(
                          '$index cm',
                          style: TextStyle(
                            fontFamily: 'Lufga',
                            fontSize: 30,
                            color: index == selectedAge
                                ? const Color(0xff7FFA88)
                                : Colors.grey,
                            fontWeight: index == selectedAge
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                    childCount: 250, // Numbers from 0 to 100
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Constbutton(onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SpecifyYourGoalScreen()),);

          }, text: 'Continue',),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}