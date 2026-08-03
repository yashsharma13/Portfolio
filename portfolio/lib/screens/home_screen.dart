import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/drawer.dart';
import 'package:portfolio/widgets/section.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/contact_form.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const HomeScreen({
    super.key,
    required this.toggleTheme,
    required this.isDark,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final Uri _resumeUrl = Uri.parse(
    'https://drive.google.com/file/d/1Uq0MJPrACIl8UfF-e_PolSScVTXfbzUY/view?usp=drivesdk',
  );
  final Uri _githubUrl = Uri.parse('https://github.com/yashsharma13');
  final Uri _linkedinUrl = Uri.parse(
    'https://www.linkedin.com/in/yash-sharma-5270912b1',
  );
  final Uri _emailUrl = Uri.parse('mailto:ys686722@gmail.com');

  final ScrollController _scrollController = ScrollController();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchUrl(Uri url) async {
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch URL: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F172A), Color(0xFF111827), Color(0xFF1E293B)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child:
              isMobile
                  ? Column(
                    children: [
                      _buildProfileImage(),
                      const SizedBox(height: 20),
                      _buildHeroContent(context),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(flex: 6, child: _buildHeroContent(context)),
                      const SizedBox(width: 60),
                      Expanded(
                        flex: 4,
                        child: Center(child: _buildProfileImage()),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 2),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 25),
          ],
        ),
        child: const CircleAvatar(
          radius: 120,
          backgroundImage: AssetImage('assets/images/yashhh.jpeg'),
        ),
      ),
    );
  }

  // Widget _buildHeroContent(BuildContext context) {
  //   final theme = Theme.of(context);

  //   return TweenAnimationBuilder<double>(
  //     tween: Tween(begin: 0, end: 1),
  //     duration: const Duration(milliseconds: 1000),
  //     curve: Curves.easeOut,
  //     builder: (context, value, child) {
  //       return Opacity(
  //         opacity: value,
  //         child: Transform.translate(
  //           offset: Offset(-40 * (1 - value), 0),
  //           child: child,
  //         ),
  //       );
  //     },
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
  //           decoration: BoxDecoration(
  //             color: Colors.teal.withOpacity(0.12),
  //             borderRadius: BorderRadius.circular(30),
  //           ),
  //           child: const Text(
  //             "Available for Freelance & Full-Time",
  //             style: TextStyle(
  //               color: Colors.tealAccent,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ),

  //         const SizedBox(height: 24),

  //         Text(
  //           "Yash Sharma",
  //           style: theme.textTheme.displayMedium?.copyWith(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //             height: 1.1,
  //           ),
  //         ),

  //         const SizedBox(height: 12),

  //         Text(
  //           "Flutter & MERN Stack Developer",
  //           style: theme.textTheme.headlineSmall?.copyWith(
  //             color: Colors.tealAccent,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),

  //         const SizedBox(height: 24),

  //         ConstrainedBox(
  //           constraints: const BoxConstraints(maxWidth: 600),
  //           child: Text(
  //             "I build scalable mobile applications with Flutter and modern web solutions using the MERN stack. Passionate about clean architecture, performance optimization and delivering high-quality user experiences.",
  //             style: theme.textTheme.bodyLarge?.copyWith(
  //               color: Colors.white70,
  //               height: 1.8,
  //             ),
  //           ),
  //         ),

  //         const SizedBox(height: 35),

  //         Wrap(
  //           spacing: 15,
  //           runSpacing: 15,
  //           children: [
  //             ElevatedButton.icon(
  //               onPressed: () => _launchUrl(_resumeUrl),

  //               icon: const Icon(Iconsax.document_download_copy, size: 18),
  //               label: const Text("Resume"),
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.teal,
  //                 foregroundColor: Colors.white,
  //                 elevation: 0,
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 18,
  //                   vertical: 12,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //               ),
  //             ),

  //             // ),
  //             OutlinedButton.icon(
  //               icon: const Icon(Icons.code),
  //               label: const Text("GitHub"),
  //               style: OutlinedButton.styleFrom(
  //                 foregroundColor: Colors.white,
  //                 side: const BorderSide(color: Colors.white24),
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 26,
  //                   vertical: 16,
  //                 ),
  //               ),
  //               onPressed: () => _launchUrl(_githubUrl),
  //             ),

  //             OutlinedButton.icon(
  //               icon: const Icon(Icons.business_center),
  //               label: const Text("LinkedIn"),
  //               style: OutlinedButton.styleFrom(
  //                 foregroundColor: Colors.white,
  //                 side: const BorderSide(color: Colors.white24),
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 26,
  //                   vertical: 16,
  //                 ),
  //               ),
  //               onPressed: () => _launchUrl(_linkedinUrl),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildHeroContent(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(-40 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "Available for Freelance & Full-Time",
              style: TextStyle(
                color: Colors.tealAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            "Yash Sharma",
            style: theme.textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Flutter & MERN Stack Developer",
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.tealAccent,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              "I build scalable mobile applications with Flutter and modern web solutions using the MERN stack. Passionate about clean architecture, performance optimization and delivering high-quality user experiences.",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
                height: 1.8,
              ),
            ),
          ),

          const SizedBox(height: 35),

          // Responsive Buttons with Scroll
          isMobile
              ? SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Resume Button
                      ElevatedButton.icon(
                        onPressed: () => _launchUrl(_resumeUrl),
                        icon: const Icon(
                          Iconsax.document_download_copy,
                          size: 16,
                        ),
                        label: const Text("Resume"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // GitHub Button
                      OutlinedButton.icon(
                        icon: const Icon(Icons.code, size: 16),
                        label: const Text("GitHub"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white24),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _launchUrl(_githubUrl),
                      ),
                      const SizedBox(width: 10),

                      // LinkedIn Button
                      OutlinedButton.icon(
                        icon: const Icon(Icons.business_center, size: 16),
                        label: const Text("LinkedIn"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white24),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _launchUrl(_linkedinUrl),
                      ),
                    ],
                  ),
                ),
              )
              : Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _launchUrl(_resumeUrl),
                    icon: const Icon(Iconsax.document_download_copy, size: 18),
                    label: const Text("Resume"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.code),
                    label: const Text("GitHub"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () => _launchUrl(_githubUrl),
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.business_center),
                    label: const Text("LinkedIn"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () => _launchUrl(_linkedinUrl),
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 2,
      ),
      child: Column(
        children: [
          _buildAboutSection(context),
          // const SizedBox(height: 60),
          _buildProjectsSection(context),
          // const SizedBox(height: 60),
          _buildContactSection(context),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Section(
      key: aboutKey,
      title: "About Me",
      child: Column(
        children: [
          /// ABOUT + STATS
          isMobile
              ? Column(
                children: [
                  _aboutDescription(theme),
                  const SizedBox(height: 30),
                  _statsSection(),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 6, child: _aboutDescription(theme)),
                  const SizedBox(width: 50),
                  Expanded(flex: 4, child: _statsSection()),
                ],
              ),

          const SizedBox(height: 60),

          /// EXPERIENCE
          _sectionHeading("Professional Journey"),

          const SizedBox(height: 25),

          _experienceTile(
            company: "OS Solutions",
            role: "Flutter Developer",
            duration: "9 Months",
          ),

          _experienceTile(
            company: "Inventurs Minds Pvt. Ltd.",
            role: "Flutter Developer",
            duration: "1.5 Months",
          ),

          _experienceTile(
            company: "Almanet Professional Services",
            role: "Flutter Developer Intern (Remote)",
            duration: "6 Months",
          ),

          const SizedBox(height: 60),

          /// SKILLS
          _sectionHeading("Core Expertise"),

          const SizedBox(height: 20),

          _skillsSection(),
        ],
      ),
    );
  }

  Widget _sectionHeading(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
            ),
          ),
        ),
      ],
    );
  }

  Widget _aboutDescription(ThemeData theme) {
    return Text(
      '''
Flutter Developer with experience building scalable Android and iOS applications from development to production deployment.

I completed my MCA in 2025 and have worked across multiple organizations, contributing to real-world mobile applications serving active users.

My expertise includes Flutter, Firebase, REST APIs, Push Notifications, Payment Integrations, App Store & Play Store deployments, debugging production issues, and performance optimization.

I have successfully delivered and maintained live applications, collaborated with cross-functional teams, and handled complete app development lifecycles.
''',
      style: theme.textTheme.bodyLarge?.copyWith(
        height: 1.9,
        fontSize: 16,
        color: Colors.white70,
      ),
    );
  }

  Widget _statsSection() {
    return Column(
      children: [
        _statItem("2+", "Years Experience"),

        const SizedBox(height: 25),

        _statItem("10+", "Live Projects"),

        const SizedBox(height: 25),

        _statItem("Android & iOS", "Platforms"),

        const SizedBox(height: 25),

        _statItem("Flutter", "Primary Stack"),
      ],
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.tealAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white60)),
      ],
    );
  }

  Widget _experienceTile({
    required String company,
    required String role,
    required String duration,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Colors.tealAccent,
                shape: BoxShape.circle,
              ),
            ),
            Container(width: 2, height: 80, color: Colors.white12),
          ],
        ),

        const SizedBox(width: 20),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                Text(role, style: const TextStyle(color: Colors.white70)),

                const SizedBox(height: 4),

                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _skillsSection() {
    final skills = [
      "Flutter",
      "Dart",
      "Firebase",
      "REST API",
      "Push Notifications",
      "Google Maps",
      "Payment Gateway",
      "Play Store",
      "App Store",
      "App Debugging",
      "Performance",
      "State Management",
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal.withOpacity(.4)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    return Section(
      key: projectsKey,
      title: "Featured Projects",
      child: Column(
        children: [
          ProjectCard(
            title: "Zanvito Customer App",
            description:
                "On-demand home services platform available on both Google Play Store and Apple App Store. Users can book services including salon, spa, plumbing, electrical work, appliance repair, drainage maintenance and more. Implemented online payments, push notifications, service booking workflow and real-time order tracking.",
            technologies: [
              "Flutter",
              "Firebase",
              "REST API",
              "Push Notifications",
              "Payment Gateway",
              "Android",
              "iOS",
            ],
            githubLink: "",
            onTap: _launchUrl,
          ),

          const SizedBox(height: 20),

          ProjectCard(
            title: "Zanvito Provider App",
            description:
                "Service provider application for Zanvito platform. Providers can manage bookings, update job status, receive notifications, track earnings and manage customer requests in real time.",
            technologies: [
              "Flutter",
              "Firebase",
              "REST API",
              "Provider Dashboard",
              "Android",
              "iOS",
            ],
            githubLink: "",
            onTap: _launchUrl,
          ),

          const SizedBox(height: 20),

          ProjectCard(
            title: "Jinvaram Jain Community App",
            description:
                "Community-focused mobile application published on Google Play Store. Features include temple management, events, business directory, follow/unfollow temples, Jinpravah social feed, sunrise/sunset information, notifications and Jain community updates.",
            technologies: [
              "Flutter",
              "Firebase",
              "Push Notifications",
              "Community Platform",
              "Play Store",
            ],
            githubLink: "",
            onTap: _launchUrl,
          ),

          const SizedBox(height: 20),

          ProjectCard(
            title: "Divine Avatar AI",
            description:
                "AI-powered spiritual guidance application currently under testing. Users can interact through text and voice conversations and receive responses inspired by Bhagavad Gita, Quran, Bible and Guru Granth Sahib. Includes conversation history, premium voice features and daily spiritual notifications.",
            technologies: [
              "Flutter",
              "AI Integration",
              "Firebase",
              "Voice Chat",
              "Notifications",
            ],
            githubLink: "",
            onTap: _launchUrl,
          ),

          const SizedBox(height: 20),

          ProjectCard(
            title: "Nearzo & Nearzo Vendor",
            description:
                "E-commerce ecosystem consisting of customer and vendor applications. Supports product management, order handling, vendor operations and customer shopping experience. Currently in testing phase before production launch.",
            technologies: [
              "Flutter",
              "E-Commerce",
              "Vendor Management",
              "REST API",
              "Firebase",
            ],
            githubLink: "",
            onTap: _launchUrl,
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Section(
      key: contactKey,
      title: "Get In Touch",
      child: ContactForm(emailUrl: _emailUrl, linkedinUrl: _linkedinUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: buildAppBar(
        context,
        isMobile,
        aboutKey,
        projectsKey,
        contactKey,
        scrollToSection,
        widget.toggleTheme,
        widget.isDark,
      ),
      drawer:
          isMobile
              ? buildMobileDrawer(
                context,
                aboutKey,
                projectsKey,
                contactKey,
                _resumeUrl,
                _githubUrl,
                _linkedinUrl,
                _emailUrl,
                scrollToSection,
              )
              : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [_buildHeroSection(context), _buildMainContent(context)],
        ),
      ),
    );
  }
}
