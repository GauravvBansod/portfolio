import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Projects',
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'A selection of apps I have built and shipped.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 50),
            _buildProjectCards(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCards(BuildContext context) {
    final projects = [
      {
        'title': 'SmartForce',
        'subtitle': 'Goa Police & Citizen Services App',
        'icon': Icons.shield_outlined,
        'badge': 'Production',
        'badgeColor': Colors.green,
        'description': [
          'Developed tenant and employee verification modules with DigiLocker Aadhaar integration.',
          'Implemented OCR-based document processing and REST API integration.',
          'Built dynamic forms and reusable UI components using BLoC/Cubit and clean architecture.',
          'Contributed to 2 apps deployed to production for Goa Government digital initiatives.',
        ],
        'techStack': 'BLoC/Cubit • Firebase • REST APIs • Clean Architecture',
      },
      {
        'title': 'English Learning App',
        'subtitle': 'Interactive Language Learning',
        'icon': Icons.school,
        'badge': null,
        'badgeColor': null,
        'description': [
          'Developed an engaging mobile app to help users learn English interactively.',
          'Utilized GetX for robust state management and modular design.',
          'Integrated REST APIs for real-time content delivery and user input submission.',
          'Designed responsive layouts handling UI/UX edge cases across devices.',
        ],
        'techStack': 'GetX • REST APIs • Flutter • Responsive UI',
      },
      {
        'title': 'Real Estate App',
        'subtitle': 'Buy, Sell & Rent Platform',
        'icon': Icons.home,
        'badge': null,
        'badgeColor': null,
        'description': [
          'Engineered a comprehensive real estate application for buying, selling, and renting properties.',
          'Created dynamic interfaces for listings, filters, subscription plans, and property details.',
          'Integrated Google Maps with custom markers and polygon drawing for visualization.',
          'Managed API consumption for property listings, user authentication, and location-based search.',
        ],
        'techStack': 'GetX • Google Maps SDK • REST APIs • Flutter',
      },
      {
        'title': 'Real-Time Chat App',
        'subtitle': 'Instant Messaging Platform',
        'icon': Icons.mark_chat_unread,
        'badge': null,
        'badgeColor': null,
        'description': [
          'Created a scalable chat application to facilitate instant communication.',
          'Architected the backend with Firebase for real-time data synchronization.',
          'Implemented secure user authentication using Google Sign-In and email/password.',
          'Developed private messaging, dynamic contact lists, and push notifications.',
        ],
        'techStack': 'Firebase • Google Auth • Flutter • Real-time DB',
      },
      {
        'title': 'E-commerce Platform',
        'subtitle': 'Full-Featured Shopping App',
        'icon': Icons.shopping_cart,
        'badge': null,
        'badgeColor': null,
        'description': [
          'Built a scalable e-commerce platform using Flutter and Firebase.',
          'Implemented user authentication, product catalog, and secure payment gateway (Razorpay).',
          'Designed an intuitive shopping cart and order management system.',
          'Optimized for performance and seamless user experience across devices.',
        ],
        'techStack': 'Firebase • Razorpay • GetX • Flutter',
      },
    ];

    final isWebScreen = MediaQuery.of(context).size.width > 600;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: projects.map((project) {
          return _ProjectCard(
            project: project,
            isWebScreen: isWebScreen,
          );
        }).toList(),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final bool isWebScreen;

  const _ProjectCard({
    required this.project,
    required this.isWebScreen,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color? badgeColor = widget.project['badgeColor'] as Color?;
    final String? badge = widget.project['badge'] as String?;

    return MouseRegion(
      onEnter: widget.isWebScreen ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.isWebScreen ? (_) => setState(() => _isHovered = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 310,
        child: Card(
          elevation: _isHovered && widget.isWebScreen ? 14 : 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered ? Colors.teal.withOpacity(0.4) : Colors.grey.shade100,
                width: _isHovered ? 1.5 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon + Badge row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.teal, Colors.cyan],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(
                        widget.project['icon'] as IconData,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    if (badge != null && badgeColor != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: badgeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: badgeColor.withOpacity(0.4)),
                        ),
                        child: Text(
                          badge,
                          style: TextStyle(
                            color: badgeColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  widget.project['title'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  widget.project['subtitle'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                ..._buildDescriptionPoints(
                  widget.project['description'] as List<String>,
                  isCompact: widget.isWebScreen ? !_isHovered : true,
                ),
                const SizedBox(height: 14),
                // Tech stack tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.project['techStack'] as String,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Colors.teal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDescriptionPoints(List<String> points, {required bool isCompact}) {
    final displayPoints = isCompact ? points.take(2).toList() : points;
    return displayPoints.map(
          (point) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.teal, size: 14),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                point,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.4,
                ),
                maxLines: isCompact ? 2 : null,
                overflow: isCompact ? TextOverflow.ellipsis : TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    ).toList();
  }
}