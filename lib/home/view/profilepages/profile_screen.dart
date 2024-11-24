
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/view/profilepages/profile_edite_sections.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<AlignmentGeometry> _alignmentAnimation;

  String _selectedCity = 'Kerala'; // State variable for selected city

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.deepPurple.shade900,
      end: const Color(0xff7CDADA),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _alignmentAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.deepPurple.shade900, Colors.black],
                center: _alignmentAnimation.value,
                radius: 0.9,
                focalRadius: 6,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 80),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  child:
                      const Icon(Icons.person, size: 80, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  'AJAY',
                  style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, color: Colors.white),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                      },
                      child: Text(
                        'VIEW PROFILE',
                        style: GoogleFonts.manrope(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => _showCitySelectionSheet(context),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            _selectedCity, // Display selected city
                            style: GoogleFonts.manrope(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          width: 280,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ACTIVE',
                                style: GoogleFonts.manrope(
                                  color: Colors.greenAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'FITPASS HOME',
                                style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Ends on 7 Apr, 2025',
                                style: GoogleFonts.manrope(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const LinearProgressIndicator(
                                value: 0.5,
                                color: Colors.greenAccent,
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    children: [
                      _buildSection('Activity & Records', [
                        'Report',
                        'Badges',
                        'Logging',
                        'History',
                        'Downloads'
                      ]),
                      _buildSection('Account Settings', [
                        'Notifications',
                        'Contact Details',
                        'Payments',
                        'Others'
                      ]),
                      _buildSection('Fitness Devices',
                          ['Google Fit', 'Fitbit', 'TV APP', 'cultROW']),
                      _buildSection('Orders', ['View All Orders']),
                      _buildSection('Fit pass CORP', ["View All Benefits"]),
                      _buildSection('Referral,Vouchers & Gift Cards',
                          ["Refer a Friend my Referal Redeem Voucher"]),
                      _buildSection('Supports', ["Queries Tickets FAQs"]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showCitySelectionSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.black,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your city',
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  hintText: 'Search for your city',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                'Popular Cities',
                style: GoogleFonts.manrope(fontSize: 16, color: Colors.white70),
              ),
              _buildCityOption('Kerala'),
              _buildCityOption('Kochi'),
              _buildCityOption('Kozhikode'),
              _buildCityOption('Thiruvananthapuram'),
              _buildCityOption('Kannur'),
              _buildCityOption('Malappuram'),
              _buildCityOption('Palakkad'),
              _buildCityOption('Kerala'),
              _buildCityOption('Kochi'),
              _buildCityOption('Kozhikode'),
              _buildCityOption('Thiruvananthapuram'),
              _buildCityOption('Kannur'),
          
            ],
          ),
        );
      },
    );
  }

  Widget _buildCityOption(String cityName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCity = cityName; // Update the selected city
        });
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:
            Text(cityName, style: GoogleFonts.manrope(color: Colors.white70)),
      ),
    );
  }

  Widget _buildSection(String title, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: options
                  .map((option) => Text(option,
                      style: GoogleFonts.manrope(color: Colors.white70)))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
