import 'package:flutter/material.dart';
import 'package:my_app/auth/view/ProfileBuilding/your_gols_screen.dart';
import 'package:my_app/constsatnce/const_button.dart';


class LifeStyleScreen extends StatefulWidget {
  const LifeStyleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LifeStyleScreenState createState() => _LifeStyleScreenState();
}

class _LifeStyleScreenState extends State<LifeStyleScreen> {
  Map<String, bool> goals = {
    'I eat 3 balanced meal daily': true,
    'I sometimes skip meals': false,
    'I rarely plan my meal': true,
    'others': false,
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
                width: 35,
              ),
              const Text(
                "Lifestyle Assessment",
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
          }).toList(),
          const Spacer(),
          Constbutton(onTap: (){
              Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SetYourGoalScreen()),
      );
          }, text: 'Continue',),
          
          const SizedBox(height: 45),
        ],
      ),
    );
  }
}