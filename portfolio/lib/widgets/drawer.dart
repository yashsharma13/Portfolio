import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildMobileDrawer(
  BuildContext context,
  GlobalKey aboutKey,
  GlobalKey projectsKey,
  GlobalKey contactKey,
  Uri resumeUrl,
  Uri githubUrl,
  Uri linkedinUrl,
  Uri emailUrl,
  Function(GlobalKey) scrollToSection,
) {
  void scrollAndClose(GlobalKey key) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollToSection(key);
    });
  }

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.teal.shade800, Colors.black87],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/yash.jpeg'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Yash Sharma',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.tealAccent),
          title: const Text('About'),
          onTap: () => scrollAndClose(aboutKey),
        ),
        ListTile(
          leading: Icon(Icons.work, color: Colors.tealAccent),
          title: const Text('Projects'),
          onTap: () => scrollAndClose(projectsKey),
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.tealAccent),
          title: const Text('Contact'),
          onTap: () => scrollAndClose(contactKey),
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.file_download, color: Colors.tealAccent),
          title: const Text('Resume'),
          onTap: () {
            Navigator.pop(context);
            launchUrl(resumeUrl);
          },
        ),
        ListTile(
          leading: Icon(Icons.code, color: Colors.tealAccent),
          title: const Text('GitHub'),
          onTap: () {
            Navigator.pop(context);
            launchUrl(githubUrl);
          },
        ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.tealAccent),
          title: const Text('LinkedIn'),
          onTap: () {
            Navigator.pop(context);
            launchUrl(linkedinUrl);
          },
        ),
      ],
    ),
  );
}
