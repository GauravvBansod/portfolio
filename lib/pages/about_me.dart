import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Helper for consistent spacing
Widget boxH(double height) => SizedBox(height: height);
Widget boxW(double width) => SizedBox(width: width);

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  // Data for expertise items - easy to update!
  final List<Map<String, dynamic>> expertiseData = const [
    {
      'icon': Icons.code_rounded,
      'title': 'Dart & Flutter',
      'description':
      'Strong foundation in Dart and the Flutter framework for building high-performance, cross-platform apps.',
    },
    {
      'icon': Icons.sync_alt_rounded,
      'title': 'State Management',
      'description':
      'Proficient with modern state management solutions like GetX and Provider to build scalable and maintainable apps.',
    },
    {
      'icon': Icons.phonelink_setup_rounded,
      'title': 'Responsive UI/UX',
      'description':
      'Skilled in crafting responsive layouts and intuitive user experiences that work seamlessly across devices.',
    },
    {
      'icon': Icons.http_rounded,
      'title': 'RESTful APIs',
      'description':
      'Experienced in integrating with RESTful APIs to fetch and display dynamic data efficiently.',
    },
    {
      'icon': Icons.bug_report_rounded,
      'title': 'Testing & Optimization',
      'description':
      'Focused on app performance, reducing widget rebuilds, and writing unit tests for quality and stability.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      key: GlobalKey(), // Replace with your _aboutKey
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          boxH(8),
          Text(
            "Here's a little about my journey and expertise.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          boxH(40),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.teal.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // TOP PART: Profile Intro
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      // TODO: Replace with your actual image URL
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'),
                    ),
                    boxW(24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Who I Am',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          boxH(8),
                          const Text(
                            'I am a passionate Flutter Developer creating scalable, high-performance mobile applications. I thrive on building clean, maintainable code and collaborating with teams to deliver apps that exceed client expectations.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 60, thickness: 0.5),

                // BOTTOM PART: Expertise
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Expertise',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    boxH(20),
                    Wrap(
                      spacing: 20, // Horizontal space between items
                      runSpacing: 20, // Vertical space between lines
                      alignment: WrapAlignment.center,
                      children: expertiseData.map((skill) {
                        return _buildExpertiseTile(
                          icon: skill['icon'],
                          title: skill['title'],
                          description: skill['description'],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // A reusable widget for each expertise item
  Widget _buildExpertiseTile({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 260, // Fixed width for each item
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal, size: 36),
          boxH(12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          boxH(8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}