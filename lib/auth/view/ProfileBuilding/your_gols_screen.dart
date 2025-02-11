import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/constsatnce/const_button.dart';

import 'package:my_app/mainpages/view/main_screen.dart';

class SetYourGoalScreen extends StatefulWidget {
  @override
  _SetYourGoalScreenState createState() => _SetYourGoalScreenState();
}

class _SetYourGoalScreenState extends State<SetYourGoalScreen> {
  String? selectedBodyType;
  DateTime? targetDate;
  final TextEditingController currentWeightController = TextEditingController();
  final TextEditingController targetWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  "Set Your Goal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Lufga', // Ensure the Lufga font is added
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'Lorem ipsum dolor sit amet\nconsectetur.Dui tristique erat',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lufga',
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 110),
            // Body Type Dropdown
            _buildDropdown(),
            const SizedBox(height: 16),
            // Current Weight
            _buildTextField('Current Weight', currentWeightController),
            const SizedBox(height: 16),
            // Target Weight
            _buildTextField('Target Weight', targetWeightController),
            const SizedBox(height: 16),
            // Target Date
            GestureDetector(
              onTap: _pickDate,
              child: _buildTextField(
                'Target Date',
                TextEditingController(
                  text: targetDate == null
                      ? ''
                      : DateFormat('yyyy-MM-dd').format(targetDate!),
                ),
                suffixIcon:
                    const Icon(Icons.calendar_today, color: Colors.white),
                enabled: false,
              ),
            ),
            const Spacer(),
            // Save Goals Button
             Constbutton(onTap: (){
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>   MainScreen()),);
         }, text: 'Continue',),
            const SizedBox(height: 45),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedBodyType,
      items: ['Ectomorph', 'Mesomorph', 'Endomorph']
          .map((type) => DropdownMenuItem(
                value: type,
                child: Text(
                  type,
                  style: const TextStyle(color: Colors.white),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedBodyType = value;
        });
      },
      dropdownColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xff7FFA88), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xff7FFA88), width: 1.5),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      {Widget? suffixIcon, bool enabled = true}) {
    return TextField(
      controller: controller,
      enabled: enabled,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff7FFA88), width: 1.5),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        targetDate = pickedDate;
      });
    }
  }
}
