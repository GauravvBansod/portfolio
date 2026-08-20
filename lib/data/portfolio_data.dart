class Job {
  const Job({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.badge,
    required this.current,
    required this.bullets,
    required this.stack,
  });

  final String role;
  final String company;
  final String period;
  final String location;
  final String badge;
  final bool current;
  final List<String> bullets;
  final List<String> stack;
}

class Project {
  const Project({
    required this.name,
    required this.kicker,
    required this.subtitle,
    required this.summary,
    required this.stack,
    this.flagship = false,
    this.image,
  });

  final String name;
  final String kicker;
  final String subtitle;
  final String summary;
  final List<String> stack;
  final bool flagship;
  final String? image;
}

class SkillGroup {
  const SkillGroup(this.title, this.items);
  final String title;
  final List<String> items;
}

class FocusItem {
  const FocusItem(this.title, this.body);
  final String title;
  final String body;
}

class ContactLink {
  const ContactLink(this.label, this.value, this.url);
  final String label;
  final String value;
  final String url;
}

class AppData {
  static const name = 'Gaurav Bansod';
  static const role = 'Flutter Developer';
  static const location = 'Pune, India';
  static const availability = 'Available for Flutter roles · Pune, India';
  static const email = 'gauravbansod020@gmail.com';
  static const phone = '+91 70576 07975';
  static const github = 'https://github.com/GauravvBansod';
  static const linkedin =
      'https://linkedin.com/in/gaurav-bansod-483456258';
  static const resumeUrl = 'assets/resume.pdf';

  static const heroLine1 = 'Flutter developer';
  static const heroLine2 = 'shipping apps that';
  static const heroAccent = 'scale in production';

  static const heroBody =
      'Two years building Android & iOS products in Flutter and Dart — '
      'including two live apps for Goa Government digital initiatives. '
      'BLoC/Cubit, clean architecture, and API-driven UI that stays '
      'maintainable as the product grows.';

  static const aboutHeading = 'Architecture first, then pixels';
  static const aboutBody =
      "I specialise in Flutter and Dart — state management, RESTful API "
      "integration, Firebase, and responsive UI that behaves on every device. "
      "I've worked across government, edtech, and real-estate products, owning "
      "deployment, debugging, and performance optimisation alongside "
      "cross-functional teams.";

  static const degree = 'B.Tech, Electrical Engineering';
  static const degreeMeta =
      'P.E.S College of Engineering · 2019–2023 · CGPA 7.66/10';
  static const certification =
      'Java Full Stack Web Development — The Kiran Academy, Pune';

  static const stats = <List<String>>[
    ['2 yrs', 'Experience'],
    ['2', 'Gov apps live'],
    ['4+', 'Apps shipped'],
  ];

  static const marquee = <String>[
    'Flutter', 'Dart', 'BLoC · Cubit', 'GetX', 'Provider', 'REST APIs',
    'Firebase', 'Razorpay', 'Google Maps SDK', 'MVVM · MVC', 'Core Java',
    'Spring Boot',
  ];

  static const skillGroups = <SkillGroup>[
    SkillGroup('Languages & frameworks', [
      'Flutter · Dart',
      'BLoC & Cubit, GetX, Provider',
      'RESTful API integration',
      'MVVM / MVC · clean architecture',
      'Core Java · Spring Boot',
    ]),
    SkillGroup('Tools & platforms', [
      'Android Studio · VS Code',
      'Firebase · Google Cloud',
      'Postman · GitHub',
      'Firebase notifications',
      'Razorpay payment gateway',
    ]),
  ];

  static const focuses = <FocusItem>[
    FocusItem('Scalable UI',
        'Reusable widget libraries that keep screens consistent and cut build time.'),
    FocusItem('Maintainability',
        'Layered clean architecture so new features land without breaking the rest.'),
    FocusItem('Performance',
        'Profiling, debugging, and release-side optimisation before it ships.'),
  ];

  static const jobs = <Job>[
    Job(
      role: 'Jr. Flutter Developer',
      company: 'Samruddh Bharat Technologies Pvt. Ltd.',
      period: 'Jul 2025 — Present',
      location: 'Pune, India',
      badge: 'Current role',
      current: true,
      bullets: [
        'Contributed to multiple Flutter applications for Goa Government digital initiatives, with 2 apps deployed to production.',
        'Architected scalable features with BLoC/Cubit state management and clean architecture principles.',
        'Built dynamic, API-driven interfaces and reusable widget libraries, cutting effort and keeping UI consistent.',
        'Integrated REST APIs, payment gateways, Firebase services, and third-party SDKs.',
      ],
      stack: [
        'Flutter', 'Dart', 'BLoC · Cubit', 'REST APIs', 'Firebase',
        'Payments', 'Git',
      ],
    ),
    Job(
      role: 'Jr. Flutter Developer',
      company: 'Geobull Innovations LLP',
      period: 'May 2024 — Jul 2025',
      location: 'Pune, India',
      badge: '1 yr 3 mo',
      current: false,
      bullets: [
        'Built and maintained Flutter apps including an English Learning app and a Real Estate app with responsive UI/UX.',
        'Integrated REST APIs, GetX state management, and the Google Maps SDK for location-based features.',
        'Collaborated across teams to add features, resolve bugs, and raise overall app quality.',
      ],
      stack: [
        'Flutter', 'GetX', 'Google Maps SDK', 'REST APIs', 'Android Studio',
      ],
    ),
  ];

  static const projects = <Project>[
    Project(
      name: 'SmartForce',
      kicker: 'Flagship · in production',
      subtitle: 'Goa Police & citizen services app',
      summary:
          'Tenant and employee verification modules with DigiLocker Aadhaar '
          'integration and OCR-based document processing. A dynamic form engine '
          'plus reusable UI components built on BLoC/Cubit with clean '
          'architecture, backed by REST API integration.',
      stack: [
        'DigiLocker', 'OCR', 'BLoC · Cubit', 'Clean architecture', 'REST APIs',
      ],
      flagship: true,
      image: 'assets/images/smartforce.png',
    ),
    Project(
      name: 'English Learning App',
      kicker: 'Edtech · Flutter',
      subtitle: 'Interactive language learning',
      summary:
          'An interactive app for learning English, built on GetX for state '
          'management and modular design. REST APIs deliver real-time content '
          'and handle user submissions, with responsive layouts covering UI/UX '
          'edge cases across devices.',
      stack: ['GetX', 'REST APIs', 'Responsive UI'],
    ),
    Project(
      name: 'Real Estate App',
      kicker: 'Proptech · Flutter',
      subtitle: 'Buy, sell and rent workflows',
      summary:
          'Buying, selling, and renting workflows with dynamic listings, '
          'filters, subscription plans, and property detail views. Google Maps '
          'integration with custom markers and polygon drawing, plus '
          'API-driven auth and location-based search.',
      stack: ['Google Maps SDK', 'GetX', 'Auth'],
    ),
  ];

  static const contactLinks = <ContactLink>[
    ContactLink('Email', email, 'mailto:$email'),
    ContactLink('Phone', phone, 'tel:+917057607975'),
    ContactLink('LinkedIn', 'in/gaurav-bansod ↗', linkedin),
    ContactLink('GitHub', 'GauravvBansod ↗', github),
  ];
}
