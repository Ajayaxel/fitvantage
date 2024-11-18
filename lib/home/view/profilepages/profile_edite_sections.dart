import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with SingleTickerProviderStateMixin {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _gender = 'Male';
  String _visibility = 'Everyone';

  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    _nameController.text = "Ajay";
    _dobController.text = "02/09/2003";
    _heightController.text = "48";
    _weightController.text = "173";

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // Define the animation for the center of the radial gradient
    _alignmentAnimation = Tween<Alignment>(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo));

    // Define the animation for the radius of the radial gradient
    _radiusAnimation = Tween<double>(begin: 1.5, end: 2.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.deepPurple.shade900, Colors.black],
                radius: 0.9,
                center: _alignmentAnimation.value,
                
              ),
            ),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                 Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  Text("Edit profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                  Spacer(),
                   Text("SAVE",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),

                ],),
                const SizedBox(height: 20,),
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: _image == null
                          ? const Icon(Icons.person, size: 50, color: Colors.white)
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: _pickImage,
                    child: Text(
                      'UPLOAD PHOTO',
                      style: GoogleFonts.manrope(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField('Name', _nameController),
                _buildTextField('Date of Birth (Only Visible to You)', _dobController),
                _buildDropdown('Gender', ['Male', 'Female', 'Other'], _gender, (value) {
                  setState(() {
                    _gender = value!;
                  });
                }),
                _buildTextField('Height in Cms', _heightController),
                _buildTextField('Weight in Kgs', _weightController),
                _buildDropdown('Squad Visibility', ['Everyone', 'Only Me'], _visibility, (value) {
                  setState(() {
                    _visibility = value!;
                  });
                }),
                SwitchListTile(
                  title: Text(
                    'Public Profile',
                    style: GoogleFonts.manrope(color: Colors.white),
                  ),
                  value: true, // Example toggle switch
                  onChanged: (value) {},
                  activeColor: Colors.blue,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Text("Private profiles are only visible to you, people with the direct link or people you're currently collaborating with can view your profile in private mode.",
                                 textAlign: TextAlign.start, 
                  style: TextStyle(color: Colors.white60),),
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: 0.2,)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.manrope(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options, String value,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.manrope(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
        ),
        dropdownColor: Colors.black.withOpacity(0.9),
        items: options
            .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option, style: const TextStyle(color: Colors.white))))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}


