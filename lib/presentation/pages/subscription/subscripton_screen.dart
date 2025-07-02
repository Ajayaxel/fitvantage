import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isTrialEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // black background
      body: Padding(
        padding: const EdgeInsetsGeometry.only(
            left: 16, right: 16, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Top Row with back button and centered image
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFF1E1E1E),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 3), // adjust to visually center
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  "assets/Fitness/subscrtption.png",
                  height: 180,
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Premium Plan",
              style: TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Row(children: [
              Text(
                "Let’s make you fitness",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "easier & more efficient",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff7FFA88),
                  fontSize: 14,
                ),
              ),
            ]),
            const SizedBox(height: 10),
            // Features list
            const FeatureItem(text: "Advanced workout guides"),
            const FeatureItem(text: "Advanced workout guides"),
            const FeatureItem(text: "Advanced workout guides"),
            const SizedBox(height: 20),
            // Subscription Cards
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SubscriptionCard(title: "1 Month", price: "\$10.33"),
                  SubscriptionCard(
                    title: "3 Months",
                    price: "\$10.33",
                    highlight: true,
                    label: "Best Value",
                  ),
                  SubscriptionCard(title: "6 Months", price: "\$10.33"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Swipe right to see more plans",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
            const SizedBox(height: 40),
            // Toggle Trial
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF161816),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Enable 7-day free trial",
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                    value: isTrialEnabled,
                    onChanged: (value) {
                      setState(() {
                        isTrialEnabled = value;
                      });
                    },
                    activeColor: Colors.black, // thumb color when ON
                    activeTrackColor: Colors.white60, // green track when ON
                    inactiveThumbColor: Colors.black, // thumb color when OFF
                    inactiveTrackColor:
                        const Color(0xFF3F3E3E), // grey track when OFF
                    splashRadius: 0, // removes ripple or border glow
                    materialTapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // optional, reduces padding
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Subscribe Button
            Constbutton(onTap: () {}, text: "Subscribe Now"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check, color: Color(0xFF7FFA88), size: 20),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final bool highlight;
  final String? label;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    this.highlight = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111,
      height: 135,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF161816),
        borderRadius: BorderRadius.circular(16),
        border: highlight
            ? Border.all(color: const Color(0xFF00FF57), width: 2)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "$price/mo",
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
