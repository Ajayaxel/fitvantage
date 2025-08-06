import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  int selectedIndex = 0;

  final List<String> categories = ['BADMINTON', 'SWIMMING', 'TABLE TENNIS'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Text(
                "Sports",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            /// Tab Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categories.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isSelected ? Colors.white : Colors.white54,
                        decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const Divider(
              color: Color(0xff888888),
            ),
            if (selectedIndex == 0) _buildBadmintonContent(),
            if (selectedIndex == 1) _buildSwimmingContent(),
            if (selectedIndex == 2) _buildTableTennisContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBadmintonContent() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: Image.asset(
                'assets/Sports/first.png',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "HIGH-ENERGY\nDOUBLE GAMES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const Positioned(
              top: 500,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "BADMINTON",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                textAlign: TextAlign.center,
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/Sports/sport.png',
                height: 400,
              ),
              const SizedBox(height: 20),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Constbutton(onTap: () {}, text: "Try for Free"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSwimmingContent() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: Image.asset(
                'assets/Sports/second.png',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 450,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "HIGH-ENERGY\nDOUBLE GAMES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
 
          ],
        ),
   
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
               const Text(
                  "SWIMMING",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              const Text(
                textAlign: TextAlign.center,
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/Sports/men.png',
                height: 400,
              ),
              const SizedBox(height: 20),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Constbutton(onTap: () {}, text: "Try for Free"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableTennisContent() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: Image.asset(
                'assets/Sports/3th.png',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 450,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "HIGH-ENERGY\nDOUBLE GAMES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
 
          ],
        ),
   
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
               const Text(
                  "TABLE TENNIS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              const Text(
                textAlign: TextAlign.center,
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/Sports/ten.png',
                height: 400,
              ),
              const SizedBox(height: 20),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 20),
              Constbutton(onTap: () {}, text: "Try for Free"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

