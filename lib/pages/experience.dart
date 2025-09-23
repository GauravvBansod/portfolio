import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/about_me.dart';
import 'package:portfolio/utils/CommonSizedBox.dart'; // Assuming this provides boxH() helpers

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  final List<Map<String, dynamic>> experiences = const [
    {
      'company': 'Samruddh Bharat Technologies Pvt Ltd',
      'location': 'Pune, India',
      'role': 'Jr. Flutter Developer',
      'duration': 'July 2025 - Present',
      'icon': Icons.work_outline_rounded,
      'color': Colors.orange,
    },
    {
      'company': 'Geobull Innovations LLP',
      'location': 'Pune, India',
      'role': 'Jr. Flutter Developer',
      'duration': 'May 2024 - July 2025',
      'icon': Icons.work_outline_rounded,
      'color': Colors.orange,
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
          // --- MODIFIED: Using a new widget for the list ---
          _buildExperienceList(),
        ],
      ),
    );
  }

  // --- NEW WIDGET: Builds the list of experience cards ---
  Widget _buildExperienceList() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        children: experiences.map((exp) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: _buildExperienceCard(
              icon: exp['icon'],
              role: exp['role'],
              company: exp['company'],
              duration: exp['duration'],
              location: exp['location'],
              color: exp['color'],
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- NEW WIDGET: Defines the appearance of a single experience card ---
  Widget _buildExperienceCard({
    required IconData icon,
    required String role,
    required String company,
    required String duration,
    required String location,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon on the left
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.1),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 20),
            // Details on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  boxH(4),
                  Text(
                    company,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  boxH(12),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      Text(
                        duration,
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  boxH(8),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      Text(
                        location,
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}