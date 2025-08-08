// lib/widgets/internship_details_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/internship.dart';
import '../providers/internship_provider.dart';
import 'application_screen.dart';

class InternshipDetailsScreen extends StatelessWidget {
  final Internship internship;

  const InternshipDetailsScreen({
    super.key,
    required this.internship,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(internship.title, style: const TextStyle(color: lightTextColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: lightTextColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: internship.logoColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(internship.logoIcon, color: internship.logoColor, size: 80),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  internship.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  internship.company,
                  style: TextStyle(
                    fontSize: 20,
                    color: darkTextColor.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Job Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              ),
              const SizedBox(height: 12),
              _buildDetailRow(Icons.location_on, 'Location:', internship.location),
              _buildDetailRow(Icons.access_time, 'Job Type:', internship.jobType),
              const SizedBox(height: 24),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                internship.description,
                style: TextStyle(
                  fontSize: 16,
                  color: darkTextColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplicationScreen(internship: internship),
                      ),
                    );
                  },
                  style: primaryButtonStyle,
                  child: const Text('Apply Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 24),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: darkTextColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: darkTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}