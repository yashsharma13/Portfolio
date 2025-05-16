import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/drawer.dart';
import 'package:portfolio/widgets/section.dart';
import 'package:portfolio/widgets/skill_card.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/contact_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final Uri _resumeUrl = Uri.parse(
    'https://drive.google.com/file/d/1M_yI5reuoMoNq6rH-iEN46ofX8KfsTvX/view?usp=drivesdk',
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
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _slideAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
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

  // Future<void> _launchUrl(Uri url) async {
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Could not launch ${url.toString()}'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

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
    final isMobile = MediaQuery.of(context).size.width < 600;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.teal.shade900, Colors.black87],
        ),
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            transform:
                Matrix4.identity()
                  ..translate(0.0, _animationController.value * 5),
            child: CircleAvatar(
              radius: isMobile ? 80 : 100,
              backgroundImage: const AssetImage('assets/images/yash.jpeg'),
            ),
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _slideAnimation.value),
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Text(
                    "Welcome to my profile",
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.tealAccent.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            "Flutter & MERN Stack Developer",
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.file_download),
                label: const Text("Resume"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.tealAccent),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                onPressed: () => _launchUrl(_resumeUrl),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.code),
                label: const Text("GitHub"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.tealAccent),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                onPressed: () => _launchUrl(_githubUrl),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text("LinkedIn"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.tealAccent),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
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
        vertical: 40,
      ),
      child: Column(
        children: [
          _buildAboutSection(context),
          const SizedBox(height: 60),
          _buildProjectsSection(context),
          const SizedBox(height: 60),
          _buildContactSection(context),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      key: aboutKey,
      title: "About Me",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "* I am a passionate and dedicated software developer with hands-on experience in Flutter and MERN stack (MongoDB, Express.js, React.js, Node.js).\n"
            "* Currently, I'm pursuing my MCA and looking for opportunities to grow, contribute to meaningful projects, and learn from experienced developers in a collaborative environment.",
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [
              SkillCard("C Programming", Icons.copyright),
              SkillCard("Python", Icons.code),
              SkillCard("Node.js", Icons.storage),
              SkillCard("React", Icons.web),
              SkillCard("MongoDB", Icons.data_saver_on),
              SkillCard("Flutter", Icons.phone_android),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    return Section(
      key: projectsKey,
      title: "My Projects",
      child: Column(
        children: [
          ProjectCard(
            title: "School Management System",
            description:
                "* Developed a cross-platform mobile app for school management with role-based access (Admin, Teacher, Student)\n"
                "* Features: Signup/Login, student/teacher registration, fee collection, dashboards, attendance\n"
                "* Integrated REST APIs with Flutter for real-time data handling.",
            technologies: ["Flutter", "Node.js", "Express.js", "mysql"],
            githubLink: "https://github.com/yashsharma13/School_Management",
            onTap: _launchUrl,
          ),
          const SizedBox(height: 20),
          ProjectCard(
            title: "Grocery Shopping Web App",
            description:
                "* Built a full-stack grocery item management app with user-friendly UI and RESTful backend.\n"
                "* Features include product listing, add-to-cart, order placement, and admin product management dashboard.",
            technologies: ["React", "Node.js", "Express.js", "Mysql"],
            githubLink: "https://github.com/yourusername/ecommerce-platform",
            onTap: _launchUrl,
          ),
          const SizedBox(height: 20),
          ProjectCard(
            title: "Amazon Clone Website",
            description:
                "* Designed a static clone of the Amazon homepage replicating layout, navigation, and styling.\n"
                "* Practiced responsive design principles and frontend structuring.",
            technologies: ["HTML", "CSS"],
            githubLink: "https://github.com/yourusername/task-manager",
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
