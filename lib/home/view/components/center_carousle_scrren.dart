import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CenterCarousleScrren extends StatefulWidget {
  const CenterCarousleScrren({super.key});

  @override
  State<CenterCarousleScrren> createState() => _CarouleScreenState();
}

class _CarouleScreenState extends State<CenterCarousleScrren> {
  final List<String> _images = [
    "https://jhanper.in/wp-content/uploads/2024/05/Colorful-Modern-Gym-Sports-T-shirt-Mockup-2.jpg",
    "https://media.istockphoto.com/id/672116290/photo/sportsman-muay-thai-boxer-fighting-in-gloves-in-boxing-cage-isolated-on-black-background-with.jpg?s=612x612&w=0&k=20&c=6NNdFPZi_csl1kOL6WOBfeAxmA97Ypc6Db8Jt3pT4DM=",
    "https://mir-s3-cdn-cf.behance.net/project_modules/hd/c74abc36330817.5717e4d724cbe.jpg",

  ];

  final List<Map<String, String>> _carouselText = [
    {
      "title": "FITATVNGE",
      "description": "Start your journey towards a balanced life."
    },
    {
      "title": "Made for You at Fit",
      "description": "Achieve the perfect balance of diet and wellness."
    },
    {
      "title": "Keep Moving",
      "description": "Keep your body moving and your energy up with daily tips."
    },
    {
      "title": "Train Hard",
      "description": "Push your limits to reach new heights."
    },
    {
      "title": "Healthy Living",
      "description": "Embrace a lifestyle that promotes wellness."
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
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.70,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  color: Colors.black.withOpacity(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        _carouselText[index]["description"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
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
                duration: const Duration(milliseconds: 500),
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
            Colors.black.withOpacity(1.0), // Top transparent
            Colors.black.withOpacity(0), // Bottom opaque
          ],
          stops: const [0.0, 1.0],
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
