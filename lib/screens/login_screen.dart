// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isStudent = true;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image Layer
          SizedBox.expand(
            child: Image.network(
              'https://img.lovepik.com/background/20211021/large/lovepik-mobile-technology-app-icon-background-image_500452810.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // White card with curved corners
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9), // Slightly translucent white
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => setState(() => isStudent = true),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isStudent ? primaryColor : Colors.white,
                                foregroundColor: isStudent ? Colors.white : darkTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    color: isStudent ? primaryColor : Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: const Text('Student'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => setState(() => isStudent = false),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: !isStudent ? primaryColor : Colors.white,
                                foregroundColor: !isStudent ? Colors.white : darkTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    color: !isStudent ? primaryColor : Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: const Text('Company'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        isStudent ? 'Student Login' : 'Company Login',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: darkTextColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Email Address', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: 'cmai@peumple.com',
                        decoration: InputDecoration(
                          hintText: 'name@example.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: '********',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          style: primaryButtonStyle,
                          child: const Text('Login'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: darkTextColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Back button on top of the image
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: darkTextColor),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}