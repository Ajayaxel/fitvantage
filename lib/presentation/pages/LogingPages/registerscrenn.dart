import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/auth/auth_bloc.dart';
import 'package:my_app/presentation/pages/LogingPages/loging_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:my_app/presentation/widgets/eror_dialog.dart';
import 'package:my_app/presentation/widgets/loding_indiactor.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Error state variables
  String? _nameError;
  String? _emailError;
  String? _mobileError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _setupTextListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _mobileFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    
    super.dispose();
  }

  void _setupTextListeners() {
    _nameController.addListener(() {
      if (_nameError != null) {
        setState(() {
          _nameError = null;
        });
      }
    });

    _emailController.addListener(() {
      if (_emailError != null) {
        setState(() {
          _emailError = null;
        });
      }
    });

    _mobileController.addListener(() {
      if (_mobileError != null) {
        setState(() {
          _mobileError = null;
        });
      }
    });

    _passwordController.addListener(() {
      if (_passwordError != null) {
        setState(() {
          _passwordError = null;
        });
      }
    });

    _confirmPasswordController.addListener(() {
      if (_confirmPasswordError != null) {
        setState(() {
          _confirmPasswordError = null;
        });
      }
    });
  }

  // Validation methods
  String? _validateName(String name) {
    if (name.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (name.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validateEmail(String email) {
    if (email.trim().isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateMobile(String mobile) {
    if (mobile.trim().isEmpty) {
      return 'Please enter your mobile number';
    }
    if (mobile.trim().length < 10) {
      return 'Mobile number must be at least 10 digits';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleSignUp() {
    FocusScope.of(context).unfocus();

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final mobile = _mobileController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // Validate all fields
    final nameError = _validateName(name);
    final emailError = _validateEmail(email);
    final mobileError = _validateMobile(mobile);
    final passwordError = _validatePassword(password);
    final confirmPasswordError = _validateConfirmPassword(password, confirmPassword);

    setState(() {
      _nameError = nameError;
      _emailError = emailError;
      _mobileError = mobileError;
      _passwordError = passwordError;
      _confirmPasswordError = confirmPasswordError;
    });

    // Only proceed if all validations pass
    if (nameError == null && 
        emailError == null && 
        mobileError == null && 
        passwordError == null && 
        confirmPasswordError == null) {
      context.read<AuthBloc>().add(
        RegisterRequested(
          firstName: name,
          email: email,
          mobileNumber: mobile,
          password: password,
          passwordConfirmation: confirmPassword,
        ),
      );
   
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType && 
            (current is AuthError || current is RegisterSuccess),
        listener: (context, state) {
          if (state is AuthError) {
            ErrorDialog.show(context, state.errors, onOkPressed: () {});
          } else if (state is RegisterSuccess) {
            SuccessDialog.show(
              context,
              state.message,
              onOkPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Background Image
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 150,
                child: Image.asset(
                  'assets/loging/Rectangle 47.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Bottom Container
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    height: screenHeight * 0.75,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff0A0B0A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Register',
                              style: TextStyle(
                                fontFamily: "Lufga",
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),

                            const Text(
                              'Lorem ipsum dolor sit amet consectetur.\nDui tristique erat',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Lufga",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Name field
                            buildInputField(
                              "name", 
                              _nameController,
                              focusNode: _nameFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
                            ),
                            if (_nameError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _nameError!,
                                    style: const TextStyle(
                                      fontFamily: "Lufga",
                                      color: Color(0xFFFF6B6B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: _nameError != null ? 12 : 20),

                            // Email field
                            buildInputField(
                              "email", 
                              _emailController,
                              inputType: TextInputType.emailAddress,
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) => _mobileFocusNode.requestFocus(),
                            ),
                            if (_emailError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _emailError!,
                                    style: const TextStyle(
                                      fontFamily: "Lufga",
                                      color: Color(0xFFFF6B6B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: _emailError != null ? 12 : 20),

                            // Mobile field
                            buildInputField(
                              "phone number", 
                              _mobileController,
                              inputType: TextInputType.phone,
                              focusNode: _mobileFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
                            ),
                            if (_mobileError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _mobileError!,
                                    style: const TextStyle(
                                      fontFamily: "Lufga",
                                      color: Color(0xFFFF6B6B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: _mobileError != null ? 12 : 20),

                            // Password with eye icon
                            buildInputField(
                              "password", 
                              _passwordController,
                              inputType: TextInputType.visiblePassword,
                              obscure: !_isPasswordVisible,
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            if (_passwordError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _passwordError!,
                                    style: const TextStyle(
                                      fontFamily: "Lufga",
                                      color: Color(0xFFFF6B6B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: _passwordError != null ? 12 : 20),

                            // Confirm Password with eye icon
                            buildInputField(
                              "confirm password",
                              _confirmPasswordController,
                              inputType: TextInputType.visiblePassword,
                              obscure: !_isConfirmPasswordVisible,
                              focusNode: _confirmPasswordFocusNode,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _handleSignUp(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            if (_confirmPasswordError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _confirmPasswordError!,
                                    style: const TextStyle(
                                      fontFamily: "Lufga",
                                      color: Color(0xFFFF6B6B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: _confirmPasswordError != null ? 12 : 20),

                            if (state is! AuthLoading)
                              Constbutton(
                                onTap: _handleSignUp,
                                text: 'Continue',
                              )
                            else
                              const SizedBox(height: 50),

                            const SizedBox(height: 20),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: const Text(
                                'Already have an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Lufga",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Loading Overlay
              if (state is AuthLoading)
                Positioned.fill(
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      const Center(child: CustomLoadingIndicator()),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    )
    );
  }
}

Widget buildInputField(
  String hint, 
  TextEditingController controller, {
  TextInputType inputType = TextInputType.name,
  bool obscure = false,
  Widget? suffixIcon,
  FocusNode? focusNode,
  TextInputAction textInputAction = TextInputAction.next,
  void Function(String)? onFieldSubmitted,
}) {
  return Container(
    padding: suffixIcon != null 
        ? const EdgeInsets.only(left: 16, right: 8) 
        : const EdgeInsets.symmetric(horizontal: 16,),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.white),
    ),
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscure,
      style: const TextStyle(
        fontFamily: "Lufga",
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: "Lufga",
          color: Colors.white54,
          fontSize: 16,
        ),
        suffixIcon: suffixIcon != null 
            ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: suffixIcon,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
      ),
      keyboardType: inputType,
      textInputAction: textInputAction,
      onSubmitted: onFieldSubmitted,
    ),
  );
}



