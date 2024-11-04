import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouleScreen extends StatefulWidget {
  const CarouleScreen({super.key});

  @override
  State<CarouleScreen> createState() => _CarouleScreenState();
}

class _CarouleScreenState extends State<CarouleScreen> {
    final List<String> _images = [
    "https://t3.ftcdn.net/jpg/02/08/93/94/360_F_208939414_7BzTGNN1LK2RO6oVtXvBKroo5aTQQj0O.jpg",
    "https://c4.wallpaperflare.com/wallpaper/735/263/743/muscle-muscle-training-dumbbells-wallpaper-preview.jpg",
  ];

  final List<Map<String, String>> _carouselText = [
    {
      "title": "Build Your \"Cult Plate\"",
      "subtitle": "I will balance my breakfast and lunch",
      "description": "with cult plate ratio of 25 : 25 : 50 of Carbs : Protein : Fibre and go with ..."
    },
    {
      "title": "Achieve Your Goals",
      "subtitle": "Stay healthy and fit",
      "description": "Start your journey towards a balanced diet and a healthier lifestyle."
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
                        height:  MediaQuery.of(context).size.height * 0.65,
                        // child: Image.network(
                        //   imageUrl,
                        //   fit: BoxFit.cover,
                        //   width: double.infinity,
                        //   height: MediaQuery.of(context).size.height * 0.65,
                        // ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.42,
                        color: Colors.black.withOpacity(0.4), // Overlay for readability
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                                            
                            Text(
                              _carouselText[index]["title"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _carouselText[index]["subtitle"]!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _carouselText[index]["description"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Action for the button
                              },
                              child: Text("EXPOLORE",style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, backgroundColor: Colors.white.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.42,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
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
                        color: _currentIndex == entry.key ? Colors.white : Colors.grey,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(1.0), // Top transparent
            Colors.black.withOpacity(0), // Bottom opaque
          ],
          stops: [0.0, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: height,
      ),
    );
  }
}