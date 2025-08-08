import 'package:flutter/material.dart';
import '../models/internship.dart';

class InternshipApiService {
  Future<List<Internship>> fetchInternships() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));

    // Return hard-coded data as if it came from an API
    return [
      Internship(
        id: '1',
        title: 'Product Design Intern',
        company: 'Meta',
        location: 'London, UK',
        jobType: 'Full-Time',
        logoColor: const Color(0xFF00C7FF),
        logoIcon: Icons.all_inclusive,
      ),
      Internship(
        id: '2',
        title: 'Software Engineer Intern',
        company: 'Google',
        location: 'Mountain View, CA',
        jobType: 'Full-Time',
        logoColor: const Color(0xFF1E212D),
        logoIcon: Icons.g_mobiledata,
        isSaved: true,
      ),
      Internship(
        id: '3',
        title: 'Marketing Intern',
        company: 'Spotify',
        location: 'New York, NY',
        jobType: 'Part-Time',
        logoColor: const Color(0xFF1DB954),
        logoIcon: Icons.music_note,
      ),
      Internship(
        id: '4',
        title: 'Data Analyst Intern',
        company: 'Microsoft',
        location: 'Redmond, WA',
        jobType: 'Full-Time',
        logoColor: const Color(0xFFF16522),
        logoIcon: Icons.apps,
        isSaved: true,
      ),
      Internship(
        id: '5',
        title: 'UX Research Intern',
        company: 'Amazon',
        location: 'Seattle, WA',
        jobType: 'Full-Time',
        logoColor: const Color(0xFF232F3E),
        logoIcon: Icons.shopping_bag,
      ),
    ];
  }
}