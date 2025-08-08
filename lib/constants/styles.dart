import 'package:flutter/material.dart';
import 'colors.dart';

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  foregroundColor: lightTextColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
);