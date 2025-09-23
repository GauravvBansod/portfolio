import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/pages/Experience.dart';
import 'package:portfolio/pages/contact_me.dart';
import 'package:portfolio/pages/download_resume_builder.dart';
import 'package:portfolio/pages/loading/loading_widget.dart';
import 'package:portfolio/pages/project_screen.dart';
import 'package:portfolio/string.dart';
import 'package:portfolio/utils/CommonSizedBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _landingKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: _buildAppBar(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return Obx(() {
              return Get.find<HomeController>().isLoading.value
                  ? const Center(child: LoadingWidget())
                  : _buildWebLayout(context, screenSize);
            });
          } else {
            return _buildMobileLayout(context, screenSize);
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1000;
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 0, // Removes the shadow
      title: GestureDetector(
        onTap: () => _scrollToSection(_landingKey),
        child: Text(
          "Gaurav Bansod",
          style: GoogleFonts.dancingScript(
            fontSize: isMobile ? 20 : 25,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
      actions: isMobile
          ? [
        const DownloadResumeBuilder(),
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.teal),
          onSelected: (value) {
            if (value == 'Experience') {
              _scrollToSection(_experienceKey);
            } else if (value == 'Project') {
              _scrollToSection(_projectKey);
            } else if (value == 'Contact') {
              _scrollToSection(_contactKey);
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 'Experience',
              child: Text('Experience'),
            ),
            const PopupMenuItem(
              value: 'Project',
              child: Text('Project'),
            ),
            const PopupMenuItem(
              value: 'Contact',
              child: Text('Contact'),
            ),
          ],
        ),
      ]
          : [
        _navButton("Experience", () => _scrollToSection(_experienceKey)),
        boxW15(),
        _navButton("Project", () => _scrollToSection(_projectKey)),
        boxW15(),
        _navButton("Contact", () => _scrollToSection(_contactKey)),
        boxW15(),
        const DownloadResumeBuilder(),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context, Size size) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // first screen
          Container(
            key: _landingKey,
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Part
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          boxH30(),
                          const Row(
                            children: [
                              Text(
                                "Hey There,",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                " I'm Gaurav",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          boxH08(),
                          const Text(
                            "Turning ideas into delightful digital experiences.",
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          boxH10(),
                          DefaultTextStyle(
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              pause: const Duration(milliseconds: 2000),
                              animatedTexts: [
                                TyperAnimatedText('Flutter Developer'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 30,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          _skillsTap("Flutter", "assets/skils/flutter.png"),
                          _skillsTap("Dart", "assets/skils/dart.png"),
                          _skillsTap("Firebase", "assets/skils/firebase.png"),
                          _skillsTap("Bloc", "assets/skils/bloc.png"),
                          _skillsTap("GetX", "assets/skils/getX.png"),
                          _skillsTap("Github", "assets/skils/github.png"),
                          _skillsTap("Java", "assets/skils/java.png"),
                          _skillsTap("UI/UX", "assets/skils/ui.png"),
                          _skillsTap("Android", "assets/skils/social.png"),
                          _skillsTap("IOS", "assets/skils/apple.png"),
                        ],
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            boxH20(),
                            Text(
                              calculateExperience(DateTime(2024, 5, 10)),
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const Text(
                              "E  X  P  E  R  I  E  N  C  E",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      boxH20(),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                // Right Part
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      boxH40(),
                      Container(
                        height: size.height * 0.8,
                        color: Colors.transparent,
                        child: Image.asset('assets/backgrounds/img.webp'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade200, thickness: 2),
          // Experience Section
          Container(
            key: _experienceKey,
            width: size.width,
            height: size.height,
            color: Colors.white,
            alignment: Alignment.center,
            child: const ExperienceScreen(),
          ),
          // Project Section
          Container(
            key: _projectKey,
            width: size.width,
            height: size.height,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const ProjectScreen(),
          ),
          // Contact Section
          Container(
            key: _contactKey,
            width: size.width,
            height: size.height,
            color: Colors.white,
            alignment: Alignment.center,
            child: const ContactMe(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, Size size) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Landing Section
          Container(
            key: _landingKey,
            width: size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                boxH20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hey There,",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " I'm Gaurav",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                    boxH08(),
                    const Text(
                      "Turning ideas into delightful digital experiences.",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    boxH10(),
                    DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: const Duration(milliseconds: 2000),
                        animatedTexts: [
                          TyperAnimatedText('Flutter Developer'),
                        ],
                      ),
                    ),
                  ],
                ),
                boxH20(),
                Container(
                  height: size.height * 0.4,
                  color: Colors.transparent,
                  child: Image.asset('assets/backgrounds/img.webp'),
                ),
                boxH20(),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    _skillsTap("Flutter", "assets/skils/flutter.png"),
                    _skillsTap("Dart", "assets/skils/dart.png"),
                    _skillsTap("Firebase", "assets/skils/firebase.png"),
                    _skillsTap("Bloc", "assets/skils/bloc.png"),
                    _skillsTap("GetX", "assets/skils/getX.png"),
                    _skillsTap("Github", "assets/skils/github.png"),
                    _skillsTap("Java", "assets/skils/java.png"),
                    _skillsTap("UI/UX", "assets/skils/ui.png"),
                    _skillsTap("Android", "assets/skils/social.png"),
                    _skillsTap("IOS", "assets/skils/apple.png"),
                  ],
                ),
                boxH20(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      calculateExperience(DateTime(2024, 5, 10)),
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const Text(
                      "E  X  P  E  R  I  E  N  C  E",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                boxH20(),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade200, thickness: 2),
          Container(
            key: _experienceKey,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            alignment: Alignment.center,
            child: const ExperienceScreen(),
          ),
          // Project Section
          Container(
            key: _projectKey,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const ProjectScreen(),
          ),
          // Contact Section
          Container(
            key: _contactKey,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            alignment: Alignment.center,
            child: const ContactMe(),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String title, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.teal.withOpacity(0.1)),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return states.contains(MaterialState.hovered)
                  ? Colors.teal
                  : Colors.black87;
            },
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _skillsTap(String title, String ioc_img) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.teal.withOpacity(0.1)),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return states.contains(MaterialState.hovered)
                  ? Colors.teal
                  : Colors.black87;
            },
          ),
        ),
        label: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        icon: Image.asset(
          ioc_img,
          height: 30,
        ),
      ),
    );
  }
}