import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class TestimonialContainer extends StatefulWidget {
  const TestimonialContainer({super.key});

  @override
  State<TestimonialContainer> createState() => _TestimonialContainerState();
}

class _TestimonialContainerState extends State<TestimonialContainer> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<Alignment> _circle1Animation;
  late Animation<Alignment> _circle2Animation;

  @override
  void initState() {
    super.initState();

    // First circle animation: top-left to bottom-right
    _controller1 = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat(reverse: true);
    _circle1Animation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));

    // Second circle animation: bottom-left to top-right (true opposite)
    _controller2 = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat(reverse: true);
    _circle2Animation = AlignmentTween(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  Widget _buildBlurCircle(Alignment alignment, Color color) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: 0.3),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Animated blur circles with independent animations
          AnimatedBuilder(
            animation: Listenable.merge([_controller1, _controller2]),
            builder: (context, _) {
              return Stack(
                children: [
                  _buildBlurCircle(_circle1Animation.value, const Color.fromARGB(255, 2, 240, 216)),
                  _buildBlurCircle(_circle2Animation.value, const Color(0xff7FFA88)),
                ],
              );
            },
          ),
          // Glassmorphic testimonial container
          GlassmorphicContainer(
            width: 290,
            height: 220,
            borderRadius: 10,
            blur: 10,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.05),
                const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.05),
              ],
              stops: const [0.1, 1],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withValues(alpha: 0.05),
                const Color(0xFFFFFFFF).withValues(alpha: 0.05),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.format_quote, color: Colors.white, size: 45),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                    style: TextStyle(color: Colors.white, fontSize: 11, height: 1.4),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/3757957/pexels-photo-3757957.jpeg'),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Doe",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Fitness Enthusiast",
                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4),
                            Text("4.8", style: TextStyle(color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




