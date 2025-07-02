import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/ProfileBuilding/age_picker_screen.dart';


class IdentifyGenderScreen extends StatefulWidget {
  const IdentifyGenderScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IdentifyGenderScreenState createState() => _IdentifyGenderScreenState();
}

class _IdentifyGenderScreenState extends State<IdentifyGenderScreen> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0A0B0A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              // Back button and title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                   const SizedBox(width: 20,),
                  const Text(
                    "Identify Your Gender",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontFamily: 'Lufga', // Ensure the Lufga font is added
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),

              // Subtitle
              const Text(
                "Lorem ipsum dolor sit amet consectetur.\nDui tristique erat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14.0,
                  fontFamily: 'Lufga',
                ),
              ),

              // Title

              const SizedBox(
                height: 63,
              ),
              // Gender selection cards
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    child: GenderCard(
                      icon: Icons.male,
                      label: "Male",
                      isSelected: selectedGender == 'Male',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    child: GenderCard(
                      icon: Icons.female,
                      label: "Female",
                      isSelected: selectedGender == 'Female',
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedGender.isNotEmpty
                      ? () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const AgePickerScreen()),
                    );
                          // Add functionality for continue
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7FFA88),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: 'Lufga',
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const GenderCard({super.key, 
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : Colors.transparent,
        border: Border.all(
          color: isSelected ? const Color(0xff7FFA88) : const Color(0xffD9D9D9),
          width: 0.9,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: isSelected ? const Color(0xff7FFA88) : Colors.white,
              size: 40.0),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xff7FFA88) : Colors.white,
              fontSize: 16.0,
              fontFamily: 'Lufga',
            ),
          ),
        ],
      ),
    );
  }
}
