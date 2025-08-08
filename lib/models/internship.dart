import 'package:flutter/material.dart';

class Internship {
  final String id;
  final String title;
  final String company;
  final String location;
  final String jobType;
  final Color logoColor;
  final IconData logoIcon;
  final String description;
  bool isSaved;

  Internship({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.jobType,
    required this.logoColor,
    required this.logoIcon,
    this.isSaved = false,
    this.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  });
}