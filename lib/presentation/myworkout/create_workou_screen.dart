import 'package:flutter/material.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({super.key});

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  int currentPage = 0;
  String selectedGender = 'Male';
  double weight = 60.0;
  double height = 170.0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildIntroPage(),
      _buildGenderPage(),
      _buildWeightPage(),
      _buildHeightPage(),
    ];

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Align(alignment: Alignment.topRight, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: Colors.white))),
              const SizedBox(height: 16),
              _buildProgressIndicator(pages.length),
              const SizedBox(height: 24),
              Expanded(child: pages[currentPage]),
              _buildBottomButtons(pages.length),
            ],
          ),
        ),
      ),
    );
  }

  // Progress Indicator
  Widget _buildProgressIndicator(int totalSteps) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: index <= currentPage
                ? const Color(0xff7FFA88)
                : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }

  // Page 1 - Intro
  Widget _buildIntroPage() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQufu8fgBuRY7YRxzTA3l7Pvx0xU1l2wKSJFQ&s'),
        ),
        SizedBox(height: 20),
        Text(
          "James Albert",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 4),
        Text(
          "14+ yrs fitness experience\nLorem Ipsum is simply dummy text of the printing",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "Hi, Lorem Ipsum is simply dummy text of the\n"
          "printing and typesetting industry. Lorem\n"
          "Ipsum has been the industry's standard\n"
          "dummy text ever since the 1500s, when an\n"
          "unknown printer took a galley of type and\n"
          "scrambled it to make a type specimen book.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white54, fontStyle: FontStyle.italic, fontSize: 13),
        ),
      ],
    );
  }

  // Page 2 - Gender
  Widget _buildGenderPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select your gender",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        _genderOption("Male"),
        const SizedBox(height: 16),
        _genderOption("Female"),
      ],
    );
  }

  Widget _genderOption(String gender) {
    final isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? const Color(0xff7FFA88) : Colors.white24,
              width: 1.5),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected ? const Color(0xff7FFA88) : Colors.white24,
                    width: 2),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xff7FFA88),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Text(
              gender,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Page 3 - Weight
  Widget _buildWeightPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Select your weight",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        Text(
          "${weight.toStringAsFixed(1)} kg",
          style: const TextStyle(
              color: Color(0xff7FFA88),
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        Slider(
          value: weight,
          min: 30,
          max: 150,
          divisions: 240,
          label: "${weight.toStringAsFixed(1)} kg",
          activeColor: const Color(0xff7FFA88),
          onChanged: (value) {
            setState(() {
              weight = value;
            });
          },
        ),
      ],
    );
  }

  // Page 4 - Height
  Widget _buildHeightPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Select your height",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        Text(
          "${height.toStringAsFixed(1)} cm",
          style: const TextStyle(
              color: Color(0xff7FFA88),
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        Slider(
          value: height,
          min: 100,
          max: 220,
          divisions: 240,
          label: "${height.toStringAsFixed(1)} cm",
          activeColor: const Color(0xff7FFA88),
          onChanged: (value) {
            setState(() {
              height = value;
            });
          },
        ),
      ],
    );
  }

  // Bottom Buttons
  Widget _buildBottomButtons(int totalPages) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  currentPage--;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff7FFA88)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              icon: const Icon(Icons.arrow_back, color: Color(0xff7FFA88)),
              label: const Text("Previous",
                  style: TextStyle(color: Color(0xff7FFA88))),
            )
          else
            const SizedBox(width: 100), // Invisible placeholder

          ElevatedButton.icon(
            onPressed: () {
              if (currentPage < totalPages - 1) {
                setState(() {
                  currentPage++;
                });
              } else {
                // Navigate to next screen or complete
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff7FFA88),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            icon: const Text("Next",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            label: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          )
        ],
      ),
    );
  }
}

