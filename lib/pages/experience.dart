import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/CommonSizedBox.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
            'Experience',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          boxH15(),
          _buildTimeline(context),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final experiences = [
      {
        'company': 'Samruddh Bharat Technologies pvt ltd',
        'location': 'Pune, India',
        'role': 'Jr.Flutter Developer',
        'duration': 'July 2025 - Present',
        'description': 'Contributing to full-cycle app development, from UI design and code architecture to API integration and performance tuning. Building scalable, high-performance mobile applications for Android and iOS using Flutter and Dart.',
        'icon': Icons.work,
      },

      {
        'company': 'Geobull Innovations LLP',
        'location': 'Pune, India',
        'role': 'Jr.Flutter Developer',
        'duration': 'May 2024 - July 2025',
        'description': 'Developed responsive and intuitive mobile applications with a focus on clean code, state management using GetX and Provider, and integration with RESTful APIs. Collaborated with cross-functional teams to deliver client-focused solutions.',
        'icon': Icons.work,
      },

    ];

    return Container(
      constraints: BoxConstraints(maxWidth: 1000),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: experiences.length,
        itemBuilder: (context, index) {
          final experience = experiences[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline Dot and Line
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.teal.withOpacity(0.1),
                        border: Border.all(color: Colors.teal, width: 2),
                      ),
                      child: Icon(
                        experience['icon'] as IconData,
                        color: Colors.teal,
                        size: 24,
                      ),
                    ),
                    if (index < experiences.length - 1)
                      Container(
                        width: 2,
                        height: 100,
                        color: Colors.teal.withOpacity(0.3),
                      ),
                  ],
                ),
                const SizedBox(width: 20),
                // Experience Card
                Expanded(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experience['company'] as String,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          boxH08(),
                          Text(
                            experience['role'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                          boxH08(),
                          Text(
                            experience['location'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          boxH08(),
                          Text(
                            experience['duration'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          boxH15(),
                          Text(
                            experience['description'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}