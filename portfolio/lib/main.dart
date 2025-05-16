// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:portfolio/services/api_service.dart';

// void main() {
//   runApp(MyPortfolioApp());
// }

// class MyPortfolioApp extends StatelessWidget {
//   const MyPortfolioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Yash Sharma | Portfolio',
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Colors.teal,
//         colorScheme: ColorScheme.dark(
//           primary: Colors.teal,
//           secondary: Colors.tealAccent,
//         ),
//         cardTheme: CardTheme(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           margin: EdgeInsets.all(8),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
// final Uri _resumeUrl = Uri.parse(
//   'https://drive.google.com/file/d/1M_yI5reuoMoNq6rH-iEN46ofX8KfsTvX/view?usp=drivesdk',
// );
// final Uri _githubUrl = Uri.parse('https://github.com/yashsharma13');
// final Uri _linkedinUrl = Uri.parse(
//   'https://www.linkedin.com/in/yash-sharma-5270912b1',
// );
//   final Uri _emailUrl = Uri.parse('mailto:ys686722@gmail.com');

//   final ScrollController _scrollController = ScrollController();
//   final aboutKey = GlobalKey();
//   final projectsKey = GlobalKey();
//   final contactKey = GlobalKey();

//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();

//   late AnimationController _animationController;
//   late Animation<double> _slideAnimation;
//   late Animation<double> _fadeAnimation;
//   bool _isSending = false;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat(reverse: true);

//     // Animation for name sliding in
//     _slideAnimation = Tween<double>(begin: -50, end: 0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );

//     // Animation for name fading in
//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void scrollToSection(GlobalKey key) {
//     Scrollable.ensureVisible(
//       key.currentContext!,
//       duration: Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }

//   void scrollAndClose(GlobalKey key) {
//     Navigator.of(context).pop(); // Close the drawer
//     Future.delayed(Duration(milliseconds: 300), () {
//       scrollToSection(key);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 600;
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title:
//             isMobile
//                 ? Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'YASH SHARMA',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.tealAccent,
//                     ),
//                   ),
//                 )
//                 : Text(
//                   'YASH SHARMA',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.tealAccent,
//                   ),
//                 ),
//         centerTitle: false,
//         elevation: 0,
//         automaticallyImplyLeading: isMobile, // Shows drawer icon only in mobile
//         actions:
//             isMobile
//                 ? null // No actions in mobile (title is right-aligned)
//                 : [
//                   _buildAppBarButton("About", aboutKey),
//                   _buildAppBarButton("Projects", projectsKey),
//                   _buildAppBarButton("Contact", contactKey),
//                 ],
//       ),
//       drawer: isMobile ? _buildMobileDrawer() : null,
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           children: [
//             // Hero Section
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [Colors.teal.shade900, Colors.black87],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   AnimatedContainer(
//                     duration: Duration(milliseconds: 500),
//                     curve: Curves.easeInOut,
//                     transform:
//                         Matrix4.identity()
//                           ..translate(0.0, _animationController.value * 5),
//                     child: CircleAvatar(
//                       radius: isMobile ? 80 : 100,
//                       backgroundImage: AssetImage('assets/images/yash.jpeg'),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   AnimatedBuilder(
//                     animation: _animationController,
//                     builder: (context, child) {
//                       return Transform.translate(
//                         offset: Offset(0, _slideAnimation.value),
//                         child: Opacity(
//                           opacity: _fadeAnimation.value,
//                           child: Text(
//                             "Welcome to my profile",
//                             style: theme.textTheme.displaySmall?.copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               shadows: [
//                                 Shadow(
//                                   blurRadius: 10,
//                                   color: Colors.tealAccent.withOpacity(0.3),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Flutter & MERN Stack Developer",
//                     style: theme.textTheme.titleLarge?.copyWith(
//                       color: Colors.tealAccent,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Wrap(
//                     spacing: 15,
//                     runSpacing: 15,
//                     alignment: WrapAlignment.center,
//                     children: [
//                       ElevatedButton.icon(
//                         icon: Icon(Icons.file_download),
//                         label: Text("Resume"),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.tealAccent),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                         ),
//                         onPressed: () => _launchUrl(_resumeUrl),
//                       ),
//                       OutlinedButton.icon(
//                         icon: Icon(Icons.code),
//                         label: Text("GitHub"),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.tealAccent),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                         ),
//                         onPressed: () => _launchUrl(_githubUrl),
//                       ),
//                       OutlinedButton.icon(
//                         icon: Icon(Icons.person),
//                         label: Text("LinkedIn"),
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.tealAccent),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                         ),
//                         onPressed: () => _launchUrl(_linkedinUrl),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Main Content
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isMobile ? 20 : 40,
//                 vertical: 40,
//               ),
//               child: Column(
//                 children: [
//                   // About Section
//                   _buildSection(
//                     key: aboutKey,
//                     title: "About Me",
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "* I am a passionate and dedicated software developer with hands-on experience in Flutter and MERN stack (MongoDB, Express.js, React.js, Node.js).\n"
//                           "* Currently, I’m pursuing my MCA and looking for opportunities to grow, contribute to meaningful projects, and learn from experienced developers in a collaborative environment.",
//                           style: theme.textTheme.bodyLarge?.copyWith(
//                             height: 1.6,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Wrap(
//                           spacing: 20,
//                           runSpacing: 20,
//                           children: [
//                             _buildSkillCard("C Programming", Icons.copyright),
//                             _buildSkillCard("Python", Icons.code),
//                             _buildSkillCard("Node.js", Icons.storage),
//                             _buildSkillCard("React", Icons.web),
//                             _buildSkillCard("MongoDB", Icons.data_saver_on),
//                             _buildSkillCard("Flutter", Icons.phone_android),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 60),

//                   // Projects Section
//                   _buildSection(
//                     key: projectsKey,
//                     title: "My Projects",
//                     child: Column(
//                       children: [
//                         _buildProjectCard(
//                           title: "School Management System",
//                           description:
//                               "* Developed a cross-platform mobile app for school management with role-based access (Admin, Teacher, Student)\n"
//                               "* Features: Signup/Login, student/teacher registration, fee collection, dashboards, attendance\n"
//                               "* Integrated REST APIs with Flutter for real-time data handling.",
//                           technologies: [
//                             "Flutter",
//                             "Node.js",
//                             "Express.js",
//                             "mysql",
//                           ],
//                           githubLink:
//                               "https://github.com/yashsharma13/School_Management",
//                         ),
//                         SizedBox(height: 20),
//                         _buildProjectCard(
//                           title: "Grocery Shopping Web App",
//                           description:
//                               "* Built a full-stack grocery item management app with user-friendly UI and RESTful backend.\n"
//                               "* Features include product listing, add-to-cart, order placement, and admin product management dashboard.",
//                           technologies: [
//                             "React",
//                             "Node.js",
//                             "Express.js",
//                             "Mysql",
//                           ],
//                           githubLink:
//                               "https://github.com/yourusername/ecommerce-platform",
//                         ),
//                         SizedBox(height: 20),
//                         _buildProjectCard(
//                           title: "Amazon Clone Website",
//                           description:
//                               "* Designed a static clone of the Amazon homepage replicating layout, navigation, and styling.\n"
//                               "* Practiced responsive design principles and frontend structuring.",
//                           technologies: ["HTML", "CSS"],
//                           githubLink:
//                               "https://github.com/yourusername/task-manager",
//                         ),
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 60),

//                   // Contact Section
//                   _buildSection(
//                     key: contactKey,
//                     title: "Get In Touch",
//                     child: Column(
//                       children: [
//                         Text(
//                           "Have a project in mind or want to discuss opportunities? Feel free to reach out!",
//                           style: theme.textTheme.bodyLarge?.copyWith(
//                             height: 1.6,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 30),
//                         Card(
//                           elevation: 4,
//                           child: Padding(
//                             padding: EdgeInsets.all(24),
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 children: [
//                                   TextFormField(
//                                     controller: _nameController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Your Name',
//                                       prefixIcon: Icon(Icons.person),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                     validator:
//                                         (value) =>
//                                             value!.isEmpty
//                                                 ? 'Please enter your name'
//                                                 : null,
//                                   ),
//                                   SizedBox(height: 20),
//                                   TextFormField(
//                                     controller: _emailController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Your Email',
//                                       prefixIcon: Icon(Icons.email),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                     validator:
//                                         (value) =>
//                                             !value!.contains('@')
//                                                 ? 'Please enter a valid email'
//                                                 : null,
//                                   ),
//                                   SizedBox(height: 20),
//                                   TextFormField(
//                                     controller: _messageController,
//                                     decoration: InputDecoration(
//                                       labelText: 'Your Message',
//                                       prefixIcon: Icon(Icons.message),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                     maxLines: 5,
//                                     validator:
//                                         (value) =>
//                                             value!.isEmpty
//                                                 ? 'Please enter your message'
//                                                 : null,
//                                   ),
//                                   SizedBox(height: 20),
//                                   SizedBox(
//                                     width: double.infinity,
//                                     child: ElevatedButton(
//                                       onPressed:
//                                           _isSending ? null : _submitForm,
//                                       style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal: 24,
//                                           vertical: 12,
//                                         ),
//                                       ),
//                                       child:
//                                           _isSending
//                                               ? SizedBox(
//                                                 height: 20,
//                                                 width: 20,
//                                                 child: CircularProgressIndicator(
//                                                   strokeWidth: 2,
//                                                   valueColor:
//                                                       AlwaysStoppedAnimation<
//                                                         Color
//                                                       >(Colors.white),
//                                                 ),
//                                               )
//                                               : Text('Send Message'),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.email),
//                               color: Colors.tealAccent,
//                               onPressed: () => _launchUrl(_emailUrl),
//                             ),
//                             SizedBox(width: 20),
//                             IconButton(
//                               icon: Icon(Icons.phone),
//                               color: Colors.tealAccent,
//                               onPressed:
//                                   () => _launchUrl(
//                                     Uri.parse('tel:91+8349077293'),
//                                   ),
//                             ),
//                             SizedBox(width: 20),
//                             IconButton(
//                               icon: Icon(Icons.link),
//                               color: Colors.tealAccent,
//                               onPressed: () => _launchUrl(_linkedinUrl),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [Colors.teal.shade800, Colors.black87],
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundImage: AssetImage('assets/images/yash.jpeg'),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Yash Sharma',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.person, color: Colors.tealAccent),
//             title: Text('About'),
//             onTap: () => scrollAndClose(aboutKey),
//           ),
//           ListTile(
//             leading: Icon(Icons.work, color: Colors.tealAccent),
//             title: Text('Projects'),
//             onTap: () => scrollAndClose(projectsKey),
//           ),
//           ListTile(
//             leading: Icon(Icons.email, color: Colors.tealAccent),
//             title: Text('Contact'),
//             onTap: () => scrollAndClose(contactKey),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.file_download, color: Colors.tealAccent),
//             title: Text('Resume'),
//             onTap: () {
//               Navigator.pop(context);
//               _launchUrl(_resumeUrl);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAppBarButton(String text, GlobalKey key) {
//     return TextButton(
//       onPressed: () => scrollToSection(key),
//       child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
//     );
//   }

//   Widget _buildSection({
//     required GlobalKey key,
//     required String title,
//     required Widget child,
//   }) {
//     return Container(
//       key: key,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.tealAccent,
//             ),
//           ),
//           SizedBox(height: 20),
//           child,
//         ],
//       ),
//     );
//   }

//   Widget _buildSkillCard(String skill, IconData icon) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, color: Colors.tealAccent),
//             SizedBox(width: 8),
//             Text(skill),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProjectCard({
//     required String title,
//     required String description,
//     required List<String> technologies,
//     required String githubLink,
//   }) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.work, color: Colors.tealAccent),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.code),
//                   onPressed: () => _launchUrl(Uri.parse(githubLink)),
//                   tooltip: 'View on GitHub',
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(description),
//             SizedBox(height: 15),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children:
//                   technologies
//                       .map(
//                         (tech) => Chip(
//                           label: Text(tech),
//                           backgroundColor: Colors.teal.withOpacity(0.2),
//                         ),
//                       )
//                       .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isSending = true;
//       });

//       try {
//         final success = await ApiService.sendContactForm(
//           name: _nameController.text,
//           email: _emailController.text,
//           message: _messageController.text,
//         ).timeout(Duration(seconds: 10));

//         setState(() {
//           _isSending = false;
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               success
//                   ? 'Message sent successfully! I\'ll get back to you soon.'
//                   : 'Failed to send message. Please try again.',
//             ),
//             backgroundColor: success ? Colors.green : Colors.red,
//             duration: Duration(seconds: 3),
//           ),
//         );

//         if (success) {
//           _nameController.clear();
//           _emailController.clear();
//           _messageController.clear();
//         }
//       } catch (e) {
//         setState(() {
//           _isSending = false;
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Error sending message. Please check your connection.',
//             ),
//             backgroundColor: Colors.red,
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     }
//   }

//   Future<void> _launchUrl(Uri url) async {
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Could not launch ${url.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:portfolio/app/app.dart';

void main() {
  runApp(const MyPortfolioApp());
}
