import 'package:flutter/material.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: Colors.tealAccent.shade200,
          isScrollControlled: true,
          builder: (context) => const BottomSheetContent(),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Meal Plan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top handle of the bottom sheet
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              "FIT TRANSFORM MEAL PLAN",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Details Row with Vertical Dividers
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Ajay's details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ajay",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "21 years * Male * 162cm",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                // Vertical divider
                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),

                // Current weight
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "57 kg",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Current weight",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                // Vertical divider
                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),

                // Target weight
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "65 kg",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Target weight",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Section Title
            const Text(
              "Your Preferences",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            // Circle Avatars with Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleAvatarWithText(
                    "https://img.freepik.com/premium-psd/indian-food-indian-food-thali-north-indian-thali_932730-458.jpg?w=360",
                    "North indian"),
                _buildCircleAvatarWithText(
                    "https://img.freepik.com/premium-psd/indian-food-indian-food-thali-north-indian-thali_932730-458.jpg?w=360",
                    "Non Veg"),
                _buildCircleAvatarWithText(
                    "https://img.freepik.com/premium-psd/indian-food-indian-food-thali-north-indian-thali_932730-458.jpg?w=360",
                    "Lose weight"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              indent: 80,
              endIndent: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "For your ease measurement",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Mesurmentcards(),
                Mesurmentcards(),
                Mesurmentcards(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Mesurmentcards(),
                Mesurmentcards(),
                Mesurmentcards(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Conatinericons(
                    label: "Protein",
                  ),
                  Conatinericons(
                    label: "Carbs",
                  ),
                  Conatinericons(
                    label: "Fats",
                  ),
                  Conatinericons(
                    label: "Vegetables",
                  ),
                  Conatinericons(
                    label: "Beverages",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            const Text(
              "About the plan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "This plan is designed with 7 meal options under each meal. You can choose to cook any of that option that's suitable for you. You just have to remember to balance the meal option with the right combinations mentioned. For more information do not hesitate to reach out to me!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                backgroundColor:
                    Colors.white, // Set text color to black (optional)
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Set border radius to 8
                ),
                // Optional: add border color and width
              ),
              onPressed: () {
                // Add your onPressed action here
              },
              child: const Text(
                "DOWNLOAD YOUR MEAL PLAN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper method for creating a circle avatar with text
  Widget _buildCircleAvatarWithText(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: Image.network(
            imagePath,
            height: 20,
            width: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
//conatiner icons,
// ignore: must_be_immutable
class Conatinericons extends StatelessWidget {
  String label;
  Conatinericons({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSctnPeX3JQiEGqQvcDyhsnRtE7MOnbkDBpFqMEGS35uRgo7RAxa41VYsn5nx4NSGfNPRo&usqp=CAU"),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
// //conatiner icons,

class Mesurmentcards extends StatelessWidget {
  const Mesurmentcards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.food_bank),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Katori"),
            Text(
              "150 ml volume",
              style: TextStyle(color: Colors.black54, fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
//mesurment //
