import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/internship_provider.dart';
import '../widgets/internship_card.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Internships', style: TextStyle(color: lightTextColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: lightTextColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<InternshipProvider>(
        builder: (context, provider, child) {
          final savedInternships = provider.savedInternships;
          if (savedInternships.isEmpty) {
            return const Center(
              child: Text(
                'You have no saved internships yet.',
                style: TextStyle(fontSize: 16, color: darkTextColor),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: savedInternships.length,
            itemBuilder: (context, index) {
              final internship = savedInternships[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InternshipCard(internship: internship),
              );
            },
          );
        },
      ),
    );
  }
}