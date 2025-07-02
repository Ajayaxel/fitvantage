import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/ProfileBuilding/height_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';


class WeightPickerScreen extends StatefulWidget {
  const WeightPickerScreen({super.key});

  @override
  State<WeightPickerScreen> createState() => _WeightPickerScreenState();
}

class _WeightPickerScreenState extends State<WeightPickerScreen> {
  int selectedWeight = 65;

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
                width: 50,
              ),
              const Text(
                "State your weight",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontFamily: 'Lufga', // Ensure the Lufga font is added
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Center(
            child: Text(
              "Lorem ipsum dolor sit amet\nconsectetur. Dui tristique erat",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Lufga",
                fontSize: 12,
              ),textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: SizedBox(
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      final weight = index + 30; // Start from 30kg
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedWeight = weight;
                          });
                        },
                        child: Container(
                          width: 60,
                          alignment: Alignment.center,
                          child: Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: selectedWeight == weight
                                  ? const Color(0xFF7FFA88)
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    child: CustomPaint(
                      size: const Size(20, 10),
                      painter: TrianglePainter(
                        color: const Color(0xFF7FFA88),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
         Constbutton(onTap: (){
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const HeightScreen()),);
         }, text: 'Continue',),
         const SizedBox(height: 45,),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
