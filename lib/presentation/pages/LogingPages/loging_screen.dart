import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/auth/auth_bloc.dart';
import 'package:my_app/presentation/pages/LogingPages/forgetpassword.dart';
import 'package:my_app/presentation/pages/LogingPages/registerscrenn.dart';
import 'package:my_app/presentation/pages/mainpages/view/main_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:my_app/presentation/widgets/eror_dialog.dart';
import 'package:my_app/presentation/widgets/loding_indiactor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isPasswordVisible = false;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _setupTextListeners();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _setupTextListeners() {
    _emailController.addListener(() {
      if (_emailError != null) {
        setState(() {
          _emailError = null;
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
  }

  String? _validateEmail(String email) {
    if (email.trim().isEmpty) {
      return 'Please enter your email address';
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }





  void _handleLogin() {
    FocusScope.of(context).unfocus();

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final emailError = _validateEmail(email);
    final passwordError = _validatePassword(password);

    setState(() {
      _emailError = emailError;
      _passwordError = passwordError;
    });

    if (emailError == null && passwordError == null) {
      context.read<AuthBloc>().add(LoginRequested(login: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainScreen()),
            );
          } else if (state is AuthError) {
            ErrorDialog.show(context, state.errors, onOkPressed: () {  });
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff0A0B0A), Color(0xff171917)],
                    ),
                  ),
                  child: Image.asset(
                    'assets/loging/Rectangle 47.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xff171917),
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.white24,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
    
              // Login Form
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff0A0B0A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
    
                              const Text(
                                'Lorem ipsum dolor sit amet consectetur.\nDui tristique erat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Lufga",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 30),
    
                              // Email
                              _buildInputField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                hintText: 'Enter your email',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    _passwordFocusNode.requestFocus(),
                              ),
    
                              if (_emailError != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 16),
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
    
                              SizedBox(
                                  height: _emailError != null ? 12 : 20),
    
                              // Password
                              _buildPasswordField(),
    
                              if (_passwordError != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 16),
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
    
                              SizedBox(
                                  height: _passwordError != null ? 12 : 20),
    
                              if (state is! AuthLoading)
                                Constbutton(
                                  onTap: _handleLogin,
                                  text: 'Continue',
                                )
                              else
                                const SizedBox(height: 50),
    
                              const SizedBox(height: 20),
    
                              const Text(
                                'Or Connect with',
                                style: TextStyle(
                                  fontFamily: "Lufga",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
    
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildSocialIcon('assets/loging/Google.png'),
                                  _buildSocialIcon('assets/loging/apple.png'),
                                  _buildSocialIcon('assets/loging/twitter.png'),
                                  _buildSocialIcon('assets/loging/meta.png'),
                                ],
                              ),
                              const SizedBox(height: 20),
    
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
                                      ),
                                    ),
                                    child: const Text(
                                      'Don\'t have an account?',
                                      style: TextStyle(
                                        fontFamily: "Lufga",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordPage(),
                                      ),
                                    ),
                                    child: const Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                        fontFamily: "Lufga",
                                        fontSize: 12,
                                        color: Color(0xff7FFA88),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
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
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required TextInputType keyboardType,
    required TextInputAction textInputAction,
    void Function(String)? onFieldSubmitted,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: const TextStyle(
          fontFamily: "Lufga",
          fontSize: 16,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Lufga",
            color: Colors.white54,
            fontSize: 16,
          ),
        ),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onSubmitted: onFieldSubmitted,
      ),
    );
  }
Widget _buildPasswordField() {
  return Container(
    padding: const EdgeInsets.only(left: 16, right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
    ),
    child: TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: !_isPasswordVisible,
      style: const TextStyle(
        fontFamily: "Lufga",
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter your password',
        hintStyle: const TextStyle(
          fontFamily: "Lufga",
          color: Colors.white54,
          fontSize: 16,
        ),
        // 👇 This makes hint text vertically centered
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white54,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => _handleLogin(),
    ),
  );
}


  Widget _buildSocialIcon(String iconPath) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Social login coming soon!',
              style: TextStyle(fontFamily: "Lufga"),
            ),
            backgroundColor: const Color(0xFF7FFA88),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white12),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            height: 24,
            width: 24,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.login_rounded,
              color: Colors.white54,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

