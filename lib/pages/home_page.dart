import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          if (constraints.maxWidth >= 1200) {
            return _buildWebLayout(context, screenSize);
          } else {
            return _buildMobileLayout(context);
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
                      flex: 2,
                      child: Column(
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
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              pause: const Duration(milliseconds: 2000),
                              animatedTexts: [
                                TyperAnimatedText('Flutter Developer'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "1 YEARS",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          const Text(
                            "EXPERIENCE",
                            style: TextStyle(fontSize: 16, color: Colors.black87),
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
                      flex: 3,
                      child: Column(
                        children: [
                          boxH50(),
                          Container(
                            height: size.height * 0.6,
                            color: Colors.transparent,
                            child: Image.asset('assets/backgrounds/bg_with_img.png'),
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
                height: size.height,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 70),
                color: Colors.grey.shade100,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(fontSize: 32, color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    boxH20(),
                    const Text(
                      "I am a passionate and detail-oriented Flutter Developer with proven experience in designing, developing, and deploying scalable, high-performance mobile applications across Android and iOS platforms. "
                          "With a strong foundation in Dart, state management solutions (GetX and Provider), and API integration, I specialize in delivering responsive UI, intuitive UX, and efficient mobile solutions that cater to user needs and business goals.\n\n"

                          "Currently, I am working as a Flutter Developer at Geobull Innovations LLP, where I contribute to full-cycle app development – from UI design and code architecture to API integration and performance tuning. "
                          "I am skilled in building clean, maintainable code, collaborating with cross-functional teams, and delivering apps that not only meet but exceed client expectations.\n\n"

                          "Over the years, I’ve developed a deep understanding of Flutter’s widget system, responsive design, Firebase integration, and RESTful API consumption. "
                          "I’ve also taken the initiative to optimize app performance by reducing unnecessary widget rebuilds, managing state effectively, and conducting unit testing to ensure quality and stability.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
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
                child: const Text(
                  "Experience Section",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),

              // Project Section
              Container(
                key: _projectKey,
                width: size.width,
                height: size.height,
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: const Text(
                  "Project Section",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),

              // Contact Section
              Container(
                key: _contactKey,
                width: size.width,
                height: size.height,
                color: Colors.white,
                alignment: Alignment.center,
                child: const Text(
                  "Contact Section",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
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
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    onPressed: () {
                      // TODO: Resume download logic
                    },
                    child: const Text("Download Resume"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        const Text("Mobile Layout Coming Soon"),
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
}
