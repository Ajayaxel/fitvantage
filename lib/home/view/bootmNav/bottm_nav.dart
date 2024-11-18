import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/home/view/Homepages/home_screen.dart';
import 'package:my_app/home/view/bootmNav/fitness_screen.dart';
import 'package:my_app/home/view/bootmNav/sports_screen.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/page_controler.dart';


class BottmNav extends StatefulWidget {
  const BottmNav({super.key});

  @override
  State<BottmNav> createState() => _BottmNavState();
}

class _BottmNavState extends State<BottmNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomeScreen homeScreen;
  late FitnessScreen fitnessScreen;
  late SportsScreen sportsScreen;
 // late StoreScreen storeScreen;
  late TransfromController transfromcontroler;

  List<String> labels = ["Home", "Fitness", "Sports", "Store", "PagecontrolerScreen"];

  @override
  void initState() {
    homeScreen = const HomeScreen();
    fitnessScreen = const FitnessScreen();
    sportsScreen = const SportsScreen();
   // storeScreen = StoreScreen();
    transfromcontroler = const TransfromController();
    pages = [
      homeScreen,
      fitnessScreen,
      sportsScreen,
     // storeScreen,
      transfromcontroler,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTabIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurvedNavigationBar(
            height: 68,
            backgroundColor: Colors.black,
            color: Colors.black,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            items: const [
              Icon(Icons.home_outlined, color: Color(0xff7FFA88)),
              Icon(Icons.directions_run, color:  Color(0xff7FFA88)),
              Icon(Icons.sports_handball, color:  Color(0xff7FFA88)),
              //Icon(Icons.shopify, color: Color(0xff7FFA88)),
              Icon(Icons.fitness_center, color:  Color(0xff7FFA88)),
            ],
          ),
    
   
        ],
      ),
    );
  }
}
