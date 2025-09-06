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
  final GlobalKey _aboutKey = GlobalKey();
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return Obx(() {
              return Get.find<HomeController>().isLoading.value
                  ? Center(child: LoadingWidget())
                  : _buildWebLayout(context, screenSize);
            });
          } else {
            return _buildMobileLayout(context,screenSize);
          }
        },
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context, Size size) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 50), // Space for fixed nav bar
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

                         // const Spacer(),
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
                                  style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          boxH20(),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: const Text(
                          //     "gauravbansod020@gmail.com",
                          //     style: TextStyle(fontSize: 16, color: Colors.red),
                          //   ),
                          // ),
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
            Divider(color: Colors.grey.shade200,thickness: 2,),
              // About Section
              Container(
                key: _aboutKey,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                color: Colors.white,
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
                    boxH20(),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 800),
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
                              // Profile Icon/Avatar
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.teal,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 20),
                              // About Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Who I Am',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    boxH08(),
                                    const Text(
                                      'I am a passionate and detail-oriented Flutter Developer with a knack for creating scalable, high-performance mobile applications for Android and iOS platforms.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        height: 1.6,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    boxH15(),
                                    Text(
                                      'Current Role',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    boxH08(),
                                    const Text(
                                      'I’m currently working as a Flutter Developer at Samruddh Bharat Technologies pvt ltd, where I contribute to full-cycle app development – from UI design and code architecture to API integration and performance tuning. I thrive on building clean, maintainable code and collaborating with cross-functional teams to deliver apps that exceed client expectations.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        height: 1.6,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    boxH15(),
                                    Text(
                                      'My Expertise',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    boxH08(),
                                    const Text(
                                      '• Strong foundation in Dart, state management (GetX, Provider), and RESTful API integration.\n'
                                          '• Skilled in crafting responsive UI and intuitive UX to meet user needs and business goals.\n'
                                          '• Experienced in optimizing app performance through efficient state management, reducing widget rebuilds, and conducting unit testing for quality and stability.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        height: 1.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              // Experience Section
              Container(
                key: _experienceKey,
                width: size.width,
                height: size.height,
                color: Colors.white,
                alignment: Alignment.center,
                child: ExperienceScreen()
              ),

              // Project Section
              Container(
                key: _projectKey,
                width: size.width,
                height: size.height,
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: ProjectScreen()
              ),

              // Contact Section
              Container(
                key: _contactKey,
                width: size.width,
                height: size.height,
                color: Colors.white,
                alignment: Alignment.center,
                child:ContactMe()
              ),
            ],
          ),
        ),

        // Fixed Navigation Bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 70,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _scrollToSection(_landingKey),
                  child: Text(
                    "Gaurav Bansod",
                    style: GoogleFonts.dancingScript(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const Spacer(),
                _navButton("About", () => _scrollToSection(_aboutKey)),
                boxW15(),
                _navButton("Experience", () => _scrollToSection(_experienceKey)),
                boxW15(),
                _navButton("Project", () => _scrollToSection(_projectKey)),
                boxW15(),
                _navButton("Contact", () => _scrollToSection(_contactKey)),
                boxW15(),
                DownloadResumeBuilder()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, Size size) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 60), // Space for fixed nav bar
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
              // About Section
              Container(
                key: _aboutKey,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'About Me',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    boxH15(),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.teal.withOpacity(0.2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.teal,
                                  size: 32,
                                ),
                              ),
                              boxH10(),
                              Text(
                                'Who I Am',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              boxH08(),
                              const Text(
                                'I am a passionate and detail-oriented Flutter Developer with a knack for creating scalable, high-performance mobile applications for Android and iOS platforms.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  height: 1.6,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              boxH15(),
                              Text(
                                'Current Role',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              boxH08(),
                              const Text(
                                'I’m currently working as a Flutter Developer at Samruddh Bharat Technologies pvt ltd, where I contribute to full-cycle app development – from UI design and code architecture to API integration and performance tuning. I thrive on building clean, maintainable code and collaborating with cross-functional teams to deliver apps that exceed client expectations.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  height: 1.6,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              boxH15(),
                              Text(
                                'My Expertise',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              boxH08(),
                              const Text(
                                '• Strong foundation in Dart, state management (GetX, Provider), and RESTful API integration.\n'
                                    '• Skilled in crafting responsive UI and intuitive UX to meet user needs and business goals.\n'
                                    '• Experienced in optimizing app performance through efficient state management, reducing widget rebuilds, and conducting unit testing for quality and stability.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Experience Section
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
        ),
        // Fixed Navigation Bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _scrollToSection(_landingKey),
                  child: Text(
                    "Gaurav Bansod",
                    style: GoogleFonts.dancingScript(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.teal),
                  onSelected: (value) {
                    if (value == 'About') {
                      _scrollToSection(_aboutKey);
                    } else if (value == 'Experience') {
                      _scrollToSection(_experienceKey);
                    } else if (value == 'Project') {
                      _scrollToSection(_projectKey);
                    } else if (value == 'Contact') {
                      _scrollToSection(_contactKey);
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'About',
                      child: Text('About'),
                    ),
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
                boxW10(),
                const DownloadResumeBuilder(),
              ],
            ),
          ),
        ),
      ],
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

  Widget _skillsTap(String title,String ioc_img) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton.icon(
        onPressed: () {

        },
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
        label: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        icon: Image.asset(ioc_img,height: 30,),
      ),
    );
  }
}
