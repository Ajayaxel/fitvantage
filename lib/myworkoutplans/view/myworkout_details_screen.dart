import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/myworkoutplans/view/Datepages/main_content.dart';

class MyworkoutDetailsScreen extends StatefulWidget {
  const MyworkoutDetailsScreen({super.key});

  @override
  State<MyworkoutDetailsScreen> createState() => _MyworkoutDetailsScreenState();
}

class _MyworkoutDetailsScreenState extends State<MyworkoutDetailsScreen> {
  DateTime _selectedDate = DateTime.now(); // Initially set to current date

  // Function to update the selected date
  void _onDateChange(DateTime date) {
    setState(() {
      _selectedDate = date; // Update the selected date
    });
  }

  // Function to show bottom sheet when more_vert is clicked
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    sheetAnimationStyle: AnimationStyle(duration: Durations.extralong1,curve: Curves.bounceInOut),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3, // Adjust height as needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Heading at the top of the bottom sheet
              Text(
                'Exercise Options', // Change to your desired heading
                style: TextStyle(
                  fontSize: 20, // Font size of the heading
                  fontWeight: FontWeight.bold, // Make it bold
                ),
              ),
              SizedBox(height: 16), // Space between heading and ListTiles
              ListTile(
                leading: Icon(Icons.info, color: Colors.greenAccent),
                title: Text("Exercise Details"),
                onTap: () {
                  // Perform any action you want when this option is clicked
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blueAccent),
                title: Text("Edit Exercise"),
                onTap: () {
                  // Perform any action you want when this option is clicked
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.redAccent),
                title: Text("Delete Exercise"),
                onTap: () {
                  // Perform any action you want when this option is clicked
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BackgroundImage(),
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, bottom: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "My workout plan",
                      style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    'Lose Weight • Beginner • 4 Days',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: DatePicker(
                    DateTime.now(),
                    height: 90,
                    width: 50,
                    locale: "en_US",
                  
                    initialSelectedDate: _selectedDate,
                    selectionColor: Colors.greenAccent,
                    selectedTextColor: Colors.white,
                    dateTextStyle: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    onDateChange: _onDateChange, // Function to change the date
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lower Body',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 22),
                    ),
                    Container(
                      height: 25,
                      width: 95,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'MISSED',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                _selectedDate.isAfter(DateTime.now())?Text('No data'):
                
                Expanded(
                  child: GestureDetector(
                  onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainContent()));
                  },
                    child: ListView(
                      children: [
                        ExpansionTile(
                          collapsedIconColor: Colors.white,
                          iconColor: Colors.greenAccent,
                          title: Text(
                            "Work Out",
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          subtitle: Text(
                            "13 MINS",
                            style: GoogleFonts.manrope(
                                color: Colors.white54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          children: [
                            ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                            
                            //Add more ListTiles as needed
                             ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                             ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                             ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                          ],
                        ),
                        // Add more ExpansionTiles as needed
                         ExpansionTile(
                          collapsedIconColor: Colors.white,
                          iconColor: Colors.greenAccent,
                          title: Text(
                            "Work Out",
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          subtitle: Text(
                            "13 MINS",
                            style: GoogleFonts.manrope(
                                color: Colors.white54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          children: [
                            ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                            
                            //Add more ListTiles as needed
                             ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                             ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                             ListTile(
                              leading: Container(
                                height: 400, // Explicitly setting height to 500
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/young-man-in-sportswear-running-picture-id1167084433?k=20&m=1167084433&s=612x612&w=0&h=7HM6zmhrb2Y9cEM3byMIuL_J9yjuYF6h1Wj8EuO4qvA=",
                                    height: 500,
                                    fit: BoxFit.cover, // Ensures the image covers the container
                                  ),
                                ),
                              ),
                              title: Text(
                                'Bodyweight Squat',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: GestureDetector(
                                onTap: () => _showBottomSheet(context), // Show bottom sheet on icon tap
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              subtitle: Text(
                                '30 secs',
                                style: GoogleFonts.manrope(color: Colors.white54),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "DO IT TODAY",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                        color: const Color.fromARGB(255, 249, 134, 134),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

