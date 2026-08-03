// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// Widget buildMobileDrawer(
//   BuildContext context,
//   GlobalKey aboutKey,
//   GlobalKey projectsKey,
//   GlobalKey contactKey,
//   Uri resumeUrl,
//   Uri githubUrl,
//   Uri linkedinUrl,
//   Uri emailUrl,
//   Function(GlobalKey) scrollToSection,
// ) {
//   void scrollAndClose(GlobalKey key) {
//     Navigator.of(context).pop();
//     Future.delayed(const Duration(milliseconds: 300), () {
//       scrollToSection(key);
//     });
//   }

//   return Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Colors.teal.shade800, Colors.black87],
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage('assets/images/yash.jpeg'),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Yash Sharma',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.person, color: Colors.tealAccent),
//           title: const Text('About'),
//           onTap: () => scrollAndClose(aboutKey),
//         ),
//         ListTile(
//           leading: Icon(Icons.work, color: Colors.tealAccent),
//           title: const Text('Projects'),
//           onTap: () => scrollAndClose(projectsKey),
//         ),
//         ListTile(
//           leading: Icon(Icons.email, color: Colors.tealAccent),
//           title: const Text('Contact'),
//           onTap: () => scrollAndClose(contactKey),
//         ),
//         const Divider(),
//         ListTile(
//           leading: Icon(Icons.file_download, color: Colors.tealAccent),
//           title: const Text('Resume'),
//           onTap: () {
//             Navigator.pop(context);
//             launchUrl(resumeUrl);
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.code, color: Colors.tealAccent),
//           title: const Text('GitHub'),
//           onTap: () {
//             Navigator.pop(context);
//             launchUrl(githubUrl);
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.person, color: Colors.tealAccent),
//           title: const Text('LinkedIn'),
//           onTap: () {
//             Navigator.pop(context);
//             launchUrl(linkedinUrl);
//           },
//         ),
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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
    Navigator.pop(context);

    Future.delayed(
      const Duration(milliseconds: 250),
      () => scrollToSection(key),
    );
  }

  return Drawer(
    backgroundColor: const Color(0xFF111827),
    child: SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.tealAccent, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage('assets/images/yash.jpeg'),
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Yash Sharma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Flutter Developer",
                  style: TextStyle(color: Colors.tealAccent, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Navigation
          _drawerTile(
            icon: Iconsax.user_copy,
            title: "About Me",
            onTap: () => scrollAndClose(aboutKey),
          ),

          _drawerTile(
            icon: Iconsax.code_copy,
            title: "Projects",
            onTap: () => scrollAndClose(projectsKey),
          ),

          _drawerTile(
            icon: Iconsax.message_copy,
            title: "Contact",
            onTap: () => scrollAndClose(contactKey),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Divider(color: Colors.white12),
          ),

          // Links
          _drawerTile(
            icon: Iconsax.document_download_copy,
            title: "Resume",
            onTap: () {
              Navigator.pop(context);
              launchUrl(resumeUrl);
            },
          ),

          _drawerTile(
            icon: Iconsax.code_1_copy,
            title: "GitHub",
            onTap: () {
              Navigator.pop(context);
              launchUrl(githubUrl);
            },
          ),

          _drawerTile(
            icon: Iconsax.personalcard_copy,
            title: "LinkedIn",
            onTap: () {
              Navigator.pop(context);
              launchUrl(linkedinUrl);
            },
          ),

          _drawerTile(
            icon: Iconsax.sms_copy,
            title: "Email",
            onTap: () {
              Navigator.pop(context);
              launchUrl(emailUrl);
            },
          ),

          const Spacer(),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: const [
                Text(
                  "Flutter • Firebase • MERN",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  "© 2026 Yash Sharma",
                  style: TextStyle(color: Colors.white24, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _drawerTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      leading: Icon(icon, color: Colors.tealAccent, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3_copy,
        color: Colors.white38,
        size: 16,
      ),
      onTap: onTap,
    ),
  );
}
