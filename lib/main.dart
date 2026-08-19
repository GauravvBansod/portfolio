import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/responsive.dart';
import 'core/theme.dart';
import 'data/portfolio_data.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'widgets/marquee_strip.dart';
import 'widgets/top_nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${AppData.name} — ${AppData.role}',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _about = GlobalKey();
  final _experience = GlobalKey();
  final _projects = GlobalKey();
  final _contact = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return;
    final target = _scrollController.offset +
        box.localToGlobal(Offset.zero).dy -
        72; // sticky nav height
    await _scrollController.animateTo(
      target.clamp(0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <NavItem>[
      NavItem('About', () => _scrollTo(_about)),
      NavItem('Experience', () => _scrollTo(_experience)),
      NavItem('Projects', () => _scrollTo(_projects)),
      NavItem('Contact', () => _scrollTo(_contact)),
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bg,
      endDrawer: NavDrawer(
        items: items,
        onResume: () => _open(AppData.resumeUrl),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: _AmbientBackground()),
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(height: Responsive.isDesktop(context) ? 72 : 66),
                  HeroSection(
                    onWork: () => _scrollTo(_projects),
                    onContact: () => _scrollTo(_contact),
                  ),
                  const MarqueeStrip(),
                  Container(key: _about, child: const AboutSection()),
                  Container(key: _experience, child: const ExperienceSection()),
                  Container(
                    key: _projects,
                    child: ProjectsSection(onGithub: () => _open(AppData.github)),
                  ),
                  Container(
                    key: _contact,
                    child: ContactSection(onOpen: _open),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopNav(
              items: items,
              onResume: () => _open(AppData.resumeUrl),
              onMenu: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final blob = size.width * .8;

    return IgnorePointer(
      child: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: AppColors.bg)),
          Positioned(
            top: -blob * .35,
            left: -blob * .2,
            child: _Glow(size: blob, color: AppColors.violet.withOpacity(.28)),
          ),
          Positioned(
            top: blob * .2,
            right: -blob * .25,
            child: _Glow(size: blob, color: AppColors.cyan.withOpacity(.18)),
          ),
          Positioned.fill(
            child: CustomPaint(painter: _GridPainter()),
          ),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
          stops: const [0, .62],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  static const double step = 64;

  @override
  void paint(Canvas canvas, Size size) {
    final fade = size.height * .5;
    final paint = Paint()..strokeWidth = 1;

    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < fade; y += step) {
        paint.color = Colors.white.withOpacity(.035 * (1 - y / fade));
        canvas.drawLine(Offset(x, y), Offset(x, (y + step).clamp(0, fade)), paint);
        canvas.drawLine(Offset(x, y), Offset((x + step).clamp(0, size.width), y), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
