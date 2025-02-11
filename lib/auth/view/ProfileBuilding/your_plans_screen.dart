import 'package:flutter/material.dart';
import 'package:my_app/auth/view/ProfileBuilding/life_style_screen.dart';

class ChooseYourPlanScreen extends StatefulWidget {
  const ChooseYourPlanScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChooseYourPlanScreenState createState() => _ChooseYourPlanScreenState();
}

class _ChooseYourPlanScreenState extends State<ChooseYourPlanScreen> {
  String _selectedPlan = ""; // Holds the selected plan's title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0B0A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 27),
                const Text(
                  "Choose Your Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Lufga',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet\nconsectetur. Dui tristique erat',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lufga',
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 37),
            SubscriptionCard(
              title: "Basic Plan",
              badgeText: "Popular",
              badgeColor: const Color(0xffEBB6B6),
              features: const [
                "Basic workout plans",
                "Diet tracking",
                "Progress monitoring"
              ],
              price: "\$9.99",
              isSelected: _selectedPlan == "Basic Plan",
              onTap: () {
                setState(() {
                  _selectedPlan = "Basic Plan";
                });
              },
            ),
            const SizedBox(height: 16),
            SubscriptionCard(
              title: "Premium Plan",
              badgeText: "Best Value",
              badgeColor: const Color(0xffF6FFA5),
              features: const [
                "Advanced workout plans",
                "Personalized nutrition",
                "1-on-1 coaching",
                "Premium features"
              ],
              price: "\$19.99",
              isSelected: _selectedPlan == "Premium Plan",
              onTap: () {
                setState(() {
                  _selectedPlan = "Premium Plan";
                });
              },
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LifeStyleScreen()),
                  );
                },
                child: const Text(
                  "Skip For Now",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String badgeText;
  final Color badgeColor;
  final List<String> features;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.badgeText,
    required this.badgeColor,
    required this.features,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xff171917),
          border: Border.all(
            color: isSelected ? const Color(0xff7FFA88) : Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badgeText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    feature,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "$price/month",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7FFA88),
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                "Subscribe",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
