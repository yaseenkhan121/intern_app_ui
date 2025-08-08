import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/internship.dart';
import '../providers/internship_provider.dart';
import 'internship_details_screen.dart';

class InternshipCard extends StatelessWidget {
  final Internship internship;

  const InternshipCard({
    super.key,
    required this.internship,
  });

  @override
  Widget build(BuildContext context) {
    final internshipProvider = Provider.of<InternshipProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InternshipDetailsScreen(internship: internship),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // ... (logo and text code remains the same)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      internship.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E212D),
                      ),
                    ),
                    Text(
                      internship.company,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF1E212D).withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          internship.location,
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF1E212D).withOpacity(0.5),
                          ),
                        ),
                        const Text(' • '),
                        Text(
                          internship.jobType,
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF1E212D).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  internship.isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: internship.isSaved ? const Color(0xFFFFB703) : Colors.grey.shade400,
                  size: 28,
                ),
                onPressed: () {
                  internshipProvider.toggleSaveStatus(internship.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}