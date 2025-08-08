// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: lightTextColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: lightTextColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Account Settings'),
          ),
          ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('Notification Preferences'),
          ),
          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text('Privacy Policy'),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About InternApp'),
          ),
        ],
      ),
    );
  }
}