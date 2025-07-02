import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/ProfileBuilding/weight_picker_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class AgePickerScreen extends StatefulWidget {
  const AgePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgePickerScreenState createState() => _AgePickerScreenState();
}

class _AgePickerScreenState extends State<AgePickerScreen> {
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
                "Specify age",
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
                  height: 5,
                  width: 86,
               
                ),
              ),
              Positioned(
                bottom: 160,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:  const Color(0xff7FFA88),),
                  height: 5,
                  width: 86,
                 
                ),
              ),
              SizedBox(
                height: 380,
                child: ListWheelScrollView.useDelegate(
                  controller:
                      FixedExtentScrollController(initialItem: selectedAge),
                  physics: const FixedExtentScrollPhysics(),
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: Text(
                          '$index',
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
                    childCount: 101, // Numbers from 0 to 100
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
                          builder: (context) =>  const WeightPickerScreen()),);

          }, text: 'Continue',),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}
