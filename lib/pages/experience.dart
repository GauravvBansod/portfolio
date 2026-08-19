import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/about_me.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  final List<Map<String, dynamic>> experiences = const [
    {
      'company': 'Samruddh Bharat Technologies Pvt. Ltd.',
      'location': 'Pune, India',
      'role': 'Jr. Flutter Developer',
      'duration': 'July 2025 – Present',
      'icon': Icons.work_outline_rounded,
      'color': Colors.teal,
      'techStack': 'Flutter • Dart • BLoC/Cubit • REST APIs • Firebase • Payment Gateway • Git',
      'highlights': [
        'Contributed to Flutter apps for Goa Government digital initiatives — 2 apps deployed to production.',
        'Architected scalable features using BLoC/Cubit and clean architecture principles.',
        'Developed dynamic, API-driven UIs and reusable widget libraries for consistency.',
        'Integrated REST APIs, payment gateways, Firebase services, and third-party SDKs.',
      ],
    },
    {
      'company': 'Geobull Innovations LLP',
      'location': 'Pune, India',
      'role': 'Jr. Flutter Developer',
      'duration': 'May 2024 – July 2025',
      'icon': Icons.work_outline_rounded,
      'color': Colors.orange,
      'techStack': 'Flutter • Dart • GetX • REST APIs • Google Maps SDK • Android Studio • Git',
      'highlights': [
        'Built and maintained Flutter apps including an English Learning app and a Real Estate app.',
        'Integrated RESTful APIs, GetX state management, and Google Maps SDK for location features.',
        'Collaborated with cross-functional teams to ship features, resolve bugs, and improve quality.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experience',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          boxH(8),
          Text(
            "My professional journey so far.",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
          ),
          boxH(40),
          _buildExperienceList(),
        ],
      ),
    );
  }

  Widget _buildExperienceList() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 860),
      child: Column(
        children: experiences.map((exp) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: _buildExperienceCard(exp),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExperienceCard(Map<String, dynamic> exp) {
    final Color color = exp['color'] as Color;
    final List<String> highlights = List<String>.from(exp['highlights']);

    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(14),
          border: Border(left: BorderSide(color: color, width: 4)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(0.12),
                  ),
                  child: Icon(exp['icon'] as IconData, color: color, size: 26),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp['role'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      boxH(2),
                      Text(
                        exp['company'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                      boxH(8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              size: 13, color: Colors.grey.shade600),
                          const SizedBox(width: 6),
                          Text(
                            exp['duration'] as String,
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.location_on_outlined,
                              size: 13, color: Colors.grey.shade600),
                          const SizedBox(width: 6),
                          Text(
                            exp['location'] as String,
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 28, thickness: 0.5),
            // Highlights
            ...highlights.map((h) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right_rounded, color: color, size: 20),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      h,
                      style: const TextStyle(
                          fontSize: 13.5, color: Colors.black87, height: 1.5),
                    ),
                  ),
                ],
              ),
            )),
            boxH(12),
            // Tech Stack chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                exp['techStack'] as String,
                style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}