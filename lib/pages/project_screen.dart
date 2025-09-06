import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/CommonSizedBox.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          boxH20(),
          Text(
            'Projects',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          boxH10(),
          _buildProjectCards(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildProjectCards(BuildContext context, Size screenSize) {
    final projects = [
      {
        'title': 'English Learning App - Flutter',
        'icon': Icons.school,
        'description': [
          'Developed an engaging mobile app to help users learn English interactively.',
          'Utilized GetX for robust state management, modular design, and smooth user interactions.',
          'Integrated REST APIs for real-time content and user input submission.',
          'Designed responsive layouts and handled UI/UX edge cases for optimal performance across devices.',
        ],
      },
      {
        'title': 'Real Estate App - Flutter',
        'icon': Icons.home,
        'description': [
          'Engineered a comprehensive real estate application with features for buying, selling, and renting properties.',
          'Created dynamic interfaces for listings, filters, subscription plans, and detailed property views.',
          'Integrated Google Maps with custom markers and polygon drawing for enhanced property visualization.',
          'Managed API consumption for property listings, user authentication, and location-based search.',
        ],
      },
    ];

    return Container(
      constraints: BoxConstraints(maxWidth: 900),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal.withOpacity(0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        project['icon'] as IconData,
                        color: Colors.teal,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Project Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project['title'] as String,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          boxH15(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: (project['description'] as List<String>)
                                .map(
                                  (point) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '• ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        point,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          height: 1.6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}