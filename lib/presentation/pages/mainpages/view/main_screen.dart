import 'package:flutter/material.dart';

import 'package:my_app/presentation/pages/mainpages/view/fitenss_screen_togle.dart';
import 'package:my_app/presentation/pages/mainpages/view/home_screen.dart';
import 'package:my_app/presentation/pages/mainpages/view/scan_screen.dart';
import 'package:my_app/presentation/pages/mainpages/view/sport_screen.dart';
import 'package:my_app/presentation/pages/transform/transform_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key,});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     HomeScreen(),
    const FitnessScreen(),
    const ScanPage(),
    const SportsScreen(),
    const TransformScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         color: const Color(0xff010A04),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: SizedBox(
        height: 108, // Explicitly set height for the BottomNavigationBar
        child: BottomNavigationBar(
          backgroundColor: const Color(0XFF171917),
          selectedItemColor: const Color(0xff7FFA88),
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 0
                    ? const Color(0xff7FFA88)
                    : Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/fiteness.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 1
                    ? const Color(0xff7FFA88)
                    : Colors.white,
              ),
              label: 'Fitness',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 2
                      ? const Color(0xff7FFA88)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/icons/qr_code_scanner_24dp_E8EAED_FILL0_wght200_GRAD0_opsz24 1.png',
                  width: 24,
                  height: 24,
                  color: _selectedIndex == 2 ? Colors.black : Colors.white,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/sports_handball_24dp_E8EAED_FILL0_wght200_GRAD0_opsz24 1.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 3
                    ? const Color(0xff7FFA88)
                    : Colors.white,
              ),
              label: 'Sports',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bubble_chart_24dp_E8EAED_FILL0_wght200_GRAD0_opsz24 1.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 4
                    ? const Color(0xff7FFA88)
                    : Colors.white,
              ),
              label: 'Transform',
            ),
          ],
        ),
      ),
    );
  }
}



// Pages for each tab




