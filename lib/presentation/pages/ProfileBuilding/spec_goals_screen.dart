import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/ProfileBuilding/your_plans_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class SpecifyYourGoalScreen extends StatefulWidget {
  const SpecifyYourGoalScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpecifyYourGoalScreenState createState() => _SpecifyYourGoalScreenState();
}

class _SpecifyYourGoalScreenState extends State<SpecifyYourGoalScreen> {
  Map<String, bool> goals = {
    'Gaining muscle mass': true,
    'Weight Loss': false,
    'Immunity enhancement': true,
    'Muscle tone': false,
    'Others': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0B0A),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                width: 40,
              ),
              const Text(
                "Specify your Goals",
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
            'Lorem ipsum dolor sit amet\nconsectetur.Dui tristique erat',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lufga',
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 126.65),
          ...goals.keys.map((goal) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(
                height: 48, // Fixed height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: goals[goal]! ? const Color(0xff7FFA88) : Colors.grey,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10), // Adjust padding for content
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goal,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.7, // Adjust this value to fine-tune the size
                      child: Switch(
                        inactiveTrackColor: Colors.black,
                        activeColor: Colors.black,
                        activeTrackColor: const Color(0xff7FFA88),
                        value: goals[goal]!,
                        onChanged: (value) {
                          setState(() {
                            goals[goal] = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const Spacer(),
           Constbutton(onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const ChooseYourPlanScreen()),);

          }, text: 'Continue',),
          const SizedBox(height: 45),
        ],
      ),
    );
  }
}
