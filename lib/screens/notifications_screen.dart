// lib/screens/notifications_screen.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: primaryColor,
        foregroundColor: lightTextColor,
      ),
      body: const Center(
        child: Text(
          'You have no new notifications.',
          style: TextStyle(
            fontSize: 18,
            color: darkTextColor,
          ),
        ),
      ),
    );
  }
}