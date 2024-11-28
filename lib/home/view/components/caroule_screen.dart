import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarouleScreen extends StatefulWidget {
  const CarouleScreen({super.key});

  @override
  State<CarouleScreen> createState() => _CarouleScreenState();
}

class _CarouleScreenState extends State<CarouleScreen> {
  final List<String> _images = [
    "assets/Backgrounds/Animation - 1732097841433.json",
    "assets/Backgrounds/bgloti.json",
  ];

  final List<Map<String, String>> _carouselText = [
    {
      "title": "Personalize your fitness platter",
      "subtitle": "I will fuel my day with balanced meals.",
      "description":
          "with the FITvantage platter ratio of25:25:50—carbs,protein, and fiber—for breakfast and lunch, and opt for a no-carb dinner."
    },
    {
      "title": "Unlock your advantage",
      "subtitle": "Achieve Balance and Strength",
      "description":
          "your journey to wellness starts here"
    },
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _images.asMap().entries.map((entry) {
            int index = entry.key;
            String imageUrl = entry.value;

            return Stack(
              alignment: Alignment.center,
              children: [
                GradientImage(
                  imageUrl: imageUrl,
                  height: MediaQuery.of(context).size.height * 0.65,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.75,
                  color:
                      Colors.black.withOpacity(0.1), // Overlay for readability
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              _carouselText[index]["title"]!,
                              curve: Curves.linear,

                              speed: const Duration(
                                  milliseconds:
                                      150), // Adjust speed for smoother wrapping
                            ),
                          ],
                        ),
                      ),
                
                      const SizedBox(height: 8),
                      Text(
                        _carouselText[index]["subtitle"]!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      //

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: DefaultTextStyle(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                _carouselText[index]["description"]!,
                                speed: const Duration(
                                    milliseconds:
                                        150), // Adjust speed for smoother wrapping
                              ),
                            ],
                          ),
                        ),
                      ),

      
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Action for the button
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: const Text(
                          "EXPLORE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.58,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: AnimatedContainer(
                duration: const Duration(microseconds: 1000),
                width: _currentIndex == entry.key ? 55 : 3,
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == entry.key ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class GradientImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const GradientImage({
    required this.imageUrl,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.7), // Top transparent
            Colors.black.withOpacity(0.4), // Bottom opaque
          ],
          stops: const [0.0, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Lottie.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: height,
      ),
    );
  }
}
