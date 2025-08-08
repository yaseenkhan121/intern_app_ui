// lib/screens/welcome_screen.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image Layer
          SizedBox.expand(
            child: Opacity(
              opacity: 0.2, // Adjust opacity for better text readability
              child: Image.network(
                'https://img.lovepik.com/background/20211021/large/lovepik-mobile-technology-app-icon-background-image_500452810.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content Layer
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.business_center, size: 64, color: primaryColor),
                const SizedBox(height: 24),
                const Text(
                  'InternApp',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Launch Your Career Journey',
                  style: TextStyle(
                    fontSize: 18,
                    color: darkTextColor,
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: primaryButtonStyle,
                    child: const Text('Login'),
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