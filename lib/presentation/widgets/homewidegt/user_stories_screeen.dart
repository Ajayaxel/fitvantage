import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SuccessCarousel extends StatefulWidget {
  const SuccessCarousel({super.key});

  @override
  State<SuccessCarousel> createState() => _SuccessCarouselState();
}

class _SuccessCarouselState extends State<SuccessCarousel> {
  final List<String> cardList =
      List.generate(5, (index) => 'assets/Homeimages/cards.png');

  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: cardList.length,
          carouselController: _controller,
          options: CarouselOptions(
            height: 230,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIdx) {
            return CardItem(imagePath: cardList[index]);
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cardList.asMap().entries.map((entry) {
            bool isActive = _currentIndex == entry.key;
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isActive ? 20.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isActive ? const Color(0xff7FFA88) : Colors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final String imagePath;

  const CardItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}

