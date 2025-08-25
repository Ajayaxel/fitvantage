import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/bookapponitemnts/booking_sucess.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class YogaDetailPage extends StatelessWidget {
  const YogaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Evolve Yoga",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Image.asset(
                "assets/Athome/yoga.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What to bring",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    const Text(
                      "Yoga Mat . Mobile Phone . +1",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildItem(
                            Icons.self_improvement, "Yoga\nMat"), // Yoga icon
                        _buildItem(
                            Icons.smartphone, "Mobile\nPhone"), // Mobile icon
                        _buildItem(Icons.local_drink,
                            "Water\nBottle"), // Water bottle icon
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Color(0xff363636),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Format Information",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "All you need to know about the\nnew format",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                        child: Image.asset(
                      "assets/Athome/yoga2.png",
                      fit: BoxFit.cover,
                      height: 350,
                    )),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: const Color(0xff161816),
                        child: Image.asset("assets/Athome/warming-up_11981625 1.png", fit: BoxFit.cover, ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Center(
                        child: Text(
                      "Improved body flexibility",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 5,),
                    const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                          "Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry. ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          ),
                    ),
                    const SizedBox(height: 12,),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: const Color(0xff161816),
                        child: Image.asset("assets/Athome/warming-up_11981625 1.png", fit: BoxFit.cover, ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Center(
                        child: Text(
                      "Improved body flexibility",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 5,),
                    const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                          "Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry. ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          ),
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Constbutton(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingSucess()));
                      }, text: "Book Now"),
                    ),
                    const SizedBox(height: 20,)
          
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 36, color: Colors.white),
      const SizedBox(height: 6),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.2,
        ),
      ),
    ],
  );
}
