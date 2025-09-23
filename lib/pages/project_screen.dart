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
        'title': 'English Learning App',
        'icon': Icons.school,
        'description': [
          'Developed an engaging mobile app for interactive English learning.',
          'Utilized GetX for robust state management and modular design.',
          'Integrated REST APIs for real-time content and user input.',
          'Designed responsive layouts for optimal performance.',
        ],
      },
      {
        'title': 'Real Estate App',
        'icon': Icons.home,
        'description': [
          'Engineered a comprehensive real estate application.',
          'Features for buying, selling, renting properties and dynamic listings.',
          'Integrated Google Maps with custom markers for visualization.',
          'Managed API consumption for listings, authentication, and search.',
        ],
      },
      {
        'title': 'Real-Time Chat App',
        'icon': Icons.mark_chat_unread,
        'description': [
          'Created a scalable chat application to facilitate instant communication.',
          'Architected the backend with Firebase to handle real-time data synchronization.',
          'Implemented **secure user authentication** using Google Sign-In and email/password.',
          'Developed core features such as private messaging and a dynamic contact list.',
        ],
      },
      {
        'title': 'E-commerce Platform',
        'icon': Icons.shopping_cart,
        'description': [
          'Built a scalable e-commerce platform using Flutter and Firebase.',
          'Implemented user authentication, product catalog, and secure payment gateway.',
          'Designed a intuitive shopping cart and order management system.',
          'Optimized for performance and seamless user experience across devices.',
        ],
      },
    ];

    // Check if the screen is considered a web screen (e.g., width > 600)
    final isWebScreen = MediaQuery.of(context).size.width > 600;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
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
    return MouseRegion(
      onEnter: widget.isWebScreen ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.isWebScreen ? (_) => setState(() => _isHovered = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        child: Card(
          elevation: _isHovered && widget.isWebScreen ? 12 : 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
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
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.project['title'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ..._buildDescriptionPoints(
                  widget.project['description'] as List<String>,
                  isCompact: widget.isWebScreen ? !_isHovered : true,
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
            const Icon(
              Icons.check_circle_outline,
              color: Colors.teal,
              size: 14,
            ),
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