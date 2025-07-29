import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VantagePass extends StatelessWidget {
  const VantagePass({super.key});
  static const fagreen = Color(0xFF7FFA88);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/vantagepass/first.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withValues(alpha: 0.5),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withValues(alpha: 0.5),
                    child: const Icon(Icons.location_on, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildCard(
              title: "Vantage",
              highlight: "FLEX",
              price: "\$15 / month*",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: "Vantage pass",
              highlight: "PLAY",
              price: "\$15 / month*",
              onPressed: () {},
              highlightColor: fagreen,
            ),
            const SizedBox(height: 30),
            const VoucherCountdownScreen(),
            const SizedBox(height: 20),
            Image.asset(
              "assets/vantagepass/running.png",
              height: 362,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer"),
            ),
            VantageFlexScreen(hedingText: "Flex", hedingcolor: Colors.grey),
            Image.asset(
              "assets/vantagepass/workoutgirl.png",
              height: 362,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer"),
            ),
            const SizedBox(
              height: 20,
            ),
            VantageFlexScreen(hedingText: "Pass", hedingcolor: fagreen),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String highlight,
    required String price,
    required VoidCallback onPressed,
    Color? highlightColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF171917),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF949494)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$title ",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [
                              Color(0xFF707079),
                              Color(0xFFF3F3F5),
                              Color(0xFFC0BFC6),
                              Color(0xFF7A7A86),
                            ],
                            stops: [0.0, 0.41, 0.73, 1.0],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcIn,
                        child: Text(
                          highlight,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Unlimited access to all\nPro gyms",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Starting at",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 23,
                  width: 80,
                  decoration: BoxDecoration(
                    color: fagreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(child: Text("BUY")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VoucherCountdownScreen extends StatefulWidget {
  const VoucherCountdownScreen({super.key});

  @override
  State<VoucherCountdownScreen> createState() => _VoucherCountdownScreenState();
}

class _VoucherCountdownScreenState extends State<VoucherCountdownScreen> {
  Duration remainingTime = const Duration(hours: 10, minutes: 48, seconds: 26);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime = remainingTime - const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatTime(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = formatTime(remainingTime.inHours);
    final minutes = formatTime(remainingTime.inMinutes % 60);
    final seconds = formatTime(remainingTime.inSeconds % 60);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF0F2515),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF7FFA88), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'FREE \$20 AMAZON VOUCHER +\n1-MONTH EXTENTION',
              textAlign: TextAlign.center,
              style: GoogleFonts.teko(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 70),
                    height: 1,
                    color: Colors.white.withValues(
                        alpha: 0.5), // for subtle look like in image
                  ),
                ),
                Text(
                  'Ends In',
                  style: GoogleFonts.teko(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8, right: 70),
                    height: 1,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timeBox(hours, 'Hrs'),
                timeColon(),
                timeBox(minutes, 'Mins'),
                timeColon(),
                timeBox(seconds, 'Sec'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget timeBox(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.teko(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.teko(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget timeColon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        ':',
        style: GoogleFonts.teko(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class VantageFlexScreen extends StatelessWidget {
  String hedingText;
  Color hedingcolor;

  static const fagreen = Color(0xFF7FFA88);

  VantageFlexScreen(
      {super.key, required this.hedingText, required this.hedingcolor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Header
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Vantage ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: hedingText,
                  style: TextStyle(
                    color: hedingcolor, // light green
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Duration cards - Horizontal scrolling
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                DurationCard(
                  duration: '12 MONTHS',
                  price: '\$20/MO*',
                ),
                SizedBox(width: 15),
                DurationCard(
                  duration: '6 MONTHS',
                  price: '\$20/MO*',
                ),
                SizedBox(width: 15),
                DurationCard(
                  duration: '3 MONTHS',
                  price: '\$20/MO*',
                ),
                SizedBox(width: 15),
                DurationCard(
                  duration: '2 MONTHS',
                  price: '\$20/MO*',
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          // Comparison section
          Row(
            children: [
              Expanded(flex: 2, child: Container()),
              const Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      'FLEX',
                      style: TextStyle(
                        color: fagreen,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'PLUS',
                      style: TextStyle(
                        color: fagreen,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '₹722/MO*',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      'FLEX',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 34),
                    Text(
                      '₹661/MO*',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Features comparison
          const FeatureRow(
            title: 'Membership Pause Days',
            flexPlusValue: '60',
            flexValue: '30',
          ),

          const FeatureRow(
            title: 'Access Credits',
            flexPlusValue: '100',
            flexValue: '50',
          ),

          const FeatureRow(
            title: 'Membership Transfer',
            flexPlusHasFeature: true,
            flexHasFeature: false,
          ),

          const FeatureRow(
            title: 'Video workouts',
            flexPlusHasFeature: true,
            flexHasFeature: false,
          ),

          // Total payable section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Total Payable',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        '\$180',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '+₹1831 (Taxes & Fees)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        '\$160',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '+₹1687 (Taxes & Fees)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Buy buttons
          Row(
            children: [
              // Center-aligned button
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                      color: fagreen,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: const Color(0xFF7FFA88), width: 1),
                    ),
                    child: const Center(
                      child: Text(
                        'BUY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Right-aligned button
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  color: fagreen,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF7FFA88), width: 1),
                ),
                child: const Center(
                  child: Text(
                    'BUY',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Footer text
          const Text(
            '*Effective Monthly Pricing including Extension, if any',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DurationCard extends StatelessWidget {
  final String duration;
  final String price;

  const DurationCard({
    Key? key,
    required this.duration,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF404040),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            duration,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final String title;
  final String? flexPlusValue;
  final String? flexValue;
  final bool? flexPlusHasFeature;
  final bool? flexHasFeature;

  const FeatureRow({
    Key? key,
    required this.title,
    this.flexPlusValue,
    this.flexValue,
    this.flexPlusHasFeature,
    this.flexHasFeature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF404040),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: flexPlusValue != null
                  ? Text(
                      flexPlusValue!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  : Icon(
                      flexPlusHasFeature == true ? Icons.check : Icons.close,
                      color: flexPlusHasFeature == true
                          ? const Color(0xFF4CAF50)
                          : Colors.grey,
                      size: 20,
                    ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: flexValue != null
                  ? Text(
                      flexValue!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  : Icon(
                      flexHasFeature == true ? Icons.check : Icons.close,
                      color: flexHasFeature == true
                          ? const Color(0xFF4CAF50)
                          : Colors.grey,
                      size: 20,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
