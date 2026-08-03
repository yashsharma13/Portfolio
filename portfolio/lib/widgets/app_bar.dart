// // // import 'package:flutter/material.dart';

// // // PreferredSizeWidget buildAppBar(
// // //   BuildContext context,
// // //   bool isMobile,
// // //   GlobalKey aboutKey,
// // //   GlobalKey projectsKey,
// // //   GlobalKey contactKey,
// // //   Function(GlobalKey) scrollToSection,
// // // ) {
// // //   return AppBar(
// // //     title:
// // //         isMobile
// // //             ? Align(
// // //               alignment: Alignment.centerRight,
// // //               child: Text(
// // //                 'YASH SHARMA',
// // //                 style: TextStyle(
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.tealAccent,
// // //                 ),
// // //               ),
// // //             )
// // //             : Text(
// // //               'YASH SHARMA',
// // //               style: TextStyle(
// // //                 fontWeight: FontWeight.bold,
// // //                 color: Colors.tealAccent,
// // //               ),
// // //             ),
// // //     centerTitle: false,
// // //     elevation: 0,
// // //     automaticallyImplyLeading: isMobile,
// // //     backgroundColor: Colors.black87,
// // //     actions:
// // //         isMobile
// // //             ? null
// // //             : [
// // //               _buildAppBarButton("About", aboutKey, scrollToSection),
// // //               _buildAppBarButton("Projects", projectsKey, scrollToSection),
// // //               _buildAppBarButton("Contact", contactKey, scrollToSection),
// // //             ],
// // //   );
// // // }

// // // Widget _buildAppBarButton(
// // //   String text,
// // //   GlobalKey key,
// // //   Function(GlobalKey) scrollToSection,
// // // ) {
// // //   return TextButton(
// // //     onPressed: () => scrollToSection(key),
// // //     child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
// // //   );
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:iconsax_flutter/iconsax_flutter.dart';

// // PreferredSizeWidget buildAppBar(
// //   BuildContext context,
// //   bool isMobile,
// //   GlobalKey aboutKey,
// //   GlobalKey projectsKey,
// //   GlobalKey contactKey,
// //   Function(GlobalKey) scrollToSection,
// //   // VoidCallback? onResumeTap,
// //   VoidCallback onThemeToggle,
// //   bool isDark,
// // ) {
// //   return AppBar(
// //     toolbarHeight: 80,
// //     elevation: 0,
// //     scrolledUnderElevation: 0,
// //     backgroundColor: const Color(0xFF0F172A),
// //     automaticallyImplyLeading: isMobile,

// //     title: Row(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         // Container(
// //         //   width: 38,
// //         //   height: 38,
// //         //   decoration: BoxDecoration(
// //         //     borderRadius: BorderRadius.circular(10),
// //         //     color: Colors.teal.withOpacity(0.15),
// //         //   ),
// //         //   child: const Icon(
// //         //     Iconsax.code_1_copy,
// //         //     color: Colors.tealAccent,
// //         //     size: 20,
// //         //   ),
// //         // ),
// //         // const SizedBox(width: 12),
// //         const Text(
// //           "YASH SHARMA",
// //           style: TextStyle(
// //             fontWeight: FontWeight.w700,
// //             fontSize: 18,
// //             letterSpacing: 1.2,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ],
// //     ),

// //     actions:
// //         isMobile
// //             ? null
// //             : [
// //               _buildNavButton(
// //                 "About",
// //                 Iconsax.user_copy,
// //                 aboutKey,
// //                 scrollToSection,
// //               ),

// //               _buildNavButton(
// //                 "Projects",
// //                 Iconsax.code_copy,
// //                 projectsKey,
// //                 scrollToSection,
// //               ),

// //               _buildNavButton(
// //                 "Contact",
// //                 Iconsax.message_copy,
// //                 contactKey,
// //                 scrollToSection,
// //               ),

// //               const SizedBox(width: 15),

// //               // IconButton(
// //               //   tooltip: isDark ? "Light Mode" : "Dark Mode",
// //               //   onPressed: onThemeToggle,
// //               //   icon: Icon(
// //               //     isDark ? Icons.light_mode : Icons.dark_mode,
// //               //     color: Colors.tealAccent,
// //               //   ),
// //               // ),
// //               // Container(
// //               //   margin: const EdgeInsets.only(right: 20, top: 14, bottom: 14),
// //               //   child: ElevatedButton.icon(
// //               //     onPressed: () {
// //               //       // Resume URL
// //               //     },
// //               //     icon: const Icon(Iconsax.document_download_copy, size: 18),
// //               //     label: const Text("Resume"),
// //               //     style: ElevatedButton.styleFrom(
// //               //       backgroundColor: Colors.teal,
// //               //       foregroundColor: Colors.white,
// //               //       elevation: 0,
// //               //       padding: const EdgeInsets.symmetric(
// //               //         horizontal: 18,
// //               //         vertical: 12,
// //               //       ),
// //               //       shape: RoundedRectangleBorder(
// //               //         borderRadius: BorderRadius.circular(12),
// //               //       ),
// //               //     ),
// //               //   ),
// //               // ),
// //             ],
// //   );
// // }

// // Widget _buildNavButton(
// //   String title,
// //   IconData icon,
// //   GlobalKey key,
// //   Function(GlobalKey) scrollToSection,
// // ) {
// //   return Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 4),
// //     child: TextButton.icon(
// //       onPressed: () => scrollToSection(key),
// //       icon: Icon(icon, size: 18, color: Colors.white70),
// //       label: Text(
// //         title,
// //         style: const TextStyle(
// //           color: Colors.white70,
// //           fontSize: 15,
// //           fontWeight: FontWeight.w500,
// //         ),
// //       ),
// //       style: TextButton.styleFrom(
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //       ),
// //     ),
// //   );
// // }

// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';

// PreferredSizeWidget buildAppBar(
//   BuildContext context,
//   bool isMobile,
//   GlobalKey aboutKey,
//   GlobalKey projectsKey,
//   GlobalKey contactKey,
//   Function(GlobalKey) scrollToSection,
//   VoidCallback onThemeToggle,
//   bool isDark,
// ) {
//   return PreferredSize(
//     preferredSize: const Size.fromHeight(80),
//     child: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Container(
//           height: 64,
//           decoration: BoxDecoration(
//             color: const Color(0xFF111827).withOpacity(.92),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.white.withOpacity(.08)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(.25),
//                 blurRadius: 30,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Left Section - Logo and Name
//               Padding(
//                 padding: EdgeInsets.only(left: isMobile ? 8 : 16),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     /// Logo
//                     Container(
//                       width: isMobile ? 36 : 44,
//                       height: isMobile ? 36 : 44,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xff14B8A6), Color(0xff06B6D4)],
//                         ),
//                         borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "YS",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w800,
//                           fontSize: isMobile ? 14 : 18,
//                         ),
//                       ),
//                     ),

//                     SizedBox(width: isMobile ? 8 : 14),

//                     /// Name and title
//                     if (!isMobile || MediaQuery.of(context).size.width > 380)
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "YASH SHARMA",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: isMobile ? 14 : 18,
//                               color: Colors.white,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           Text(
//                             "Flutter Developer",
//                             style: TextStyle(
//                               fontSize: isMobile ? 10 : 12,
//                               color: Colors.white60,
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),

//               // Center Section - Navigation Buttons (Desktop only)
//               if (!isMobile)
//                 Flexible(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _buildNavButton(
//                         "About",
//                         Iconsax.user_copy,
//                         aboutKey,
//                         scrollToSection,
//                         isMobile,
//                       ),
//                       _buildNavButton(
//                         "Projects",
//                         Iconsax.code_copy,
//                         projectsKey,
//                         scrollToSection,
//                         isMobile,
//                       ),
//                       _buildNavButton(
//                         "Contact",
//                         Iconsax.message_copy,
//                         contactKey,
//                         scrollToSection,
//                         isMobile,
//                       ),
//                     ],
//                   ),
//                 ),

//               // Right Section - Theme Toggle and Menu
//               Padding(
//                 padding: EdgeInsets.only(right: isMobile ? 8 : 16),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Theme toggle
//                     IconButton(
//                       tooltip: isDark ? "Light Mode" : "Dark Mode",
//                       onPressed: onThemeToggle,
//                       icon: Icon(
//                         isDark ? Icons.light_mode : Icons.dark_mode,
//                         color: Colors.tealAccent,
//                         size: isMobile ? 20 : 24,
//                       ),
//                       padding: const EdgeInsets.all(8),
//                       constraints: const BoxConstraints(),
//                     ),

//                     // Resume button - Desktop only
//                     if (!isMobile)
//                       Padding(
//                         padding: const EdgeInsets.only(left: 4),
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Iconsax.document_download_copy,
//                             size: 18,
//                           ),
//                           label: const Text("Resume"),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xff14B8A6),
//                             foregroundColor: Colors.white,
//                             elevation: 0,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                               vertical: 15,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),

//                     // Menu/Hamburger Icon - Mobile only
//                     if (isMobile)
//                       IconButton(
//                         onPressed: () {
//                           // Open drawer or show menu
//                           Scaffold.of(context).openDrawer();
//                         },
//                         icon: const Icon(
//                           Iconsax.menu_1,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                         padding: const EdgeInsets.all(8),
//                         constraints: const BoxConstraints(),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildNavButton(
//   String title,
//   IconData icon,
//   GlobalKey key,
//   Function(GlobalKey) scrollToSection,
//   bool isMobile,
// ) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 4),
//     child: TextButton(
//       onPressed: () => scrollToSection(key),
//       style: TextButton.styleFrom(
//         foregroundColor: Colors.white70,
//         padding: EdgeInsets.symmetric(
//           horizontal: isMobile ? 12 : 18,
//           vertical: isMobile ? 10 : 14,
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         minimumSize: isMobile ? const Size(60, 40) : null,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: isMobile ? 16 : 18, color: Colors.white70),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.white70,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
  bool isMobile,
  GlobalKey aboutKey,
  GlobalKey projectsKey,
  GlobalKey contactKey,
  Function(GlobalKey) scrollToSection,
  VoidCallback onThemeToggle,
  bool isDark,
) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFF111827).withOpacity(.92),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Section - Logo and Name
              Padding(
                padding: EdgeInsets.only(left: isMobile ? 8 : 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Logo
                    Container(
                      width: isMobile ? 36 : 44,
                      height: isMobile ? 36 : 44,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff14B8A6), Color(0xff06B6D4)],
                        ),
                        borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "YS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: isMobile ? 14 : 18,
                        ),
                      ),
                    ),

                    SizedBox(width: isMobile ? 8 : 14),

                    /// Name and title
                    if (!isMobile || MediaQuery.of(context).size.width > 380)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "YASH SHARMA",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: isMobile ? 14 : 18,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Flutter Developer",
                            style: TextStyle(
                              fontSize: isMobile ? 10 : 12,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),

              // Center Section - Navigation Buttons (Desktop only)
              if (!isMobile)
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildNavButton(
                        "About",
                        Iconsax.user_copy,
                        aboutKey,
                        scrollToSection,
                        isMobile,
                      ),
                      _buildNavButton(
                        "Projects",
                        Iconsax.code_copy,
                        projectsKey,
                        scrollToSection,
                        isMobile,
                      ),
                      _buildNavButton(
                        "Contact",
                        Iconsax.message_copy,
                        contactKey,
                        scrollToSection,
                        isMobile,
                      ),
                    ],
                  ),
                ),

              // Right Section - Theme Toggle and Menu
              Padding(
                padding: EdgeInsets.only(right: isMobile ? 8 : 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Theme toggle
                    // IconButton(
                    //   tooltip: isDark ? "Light Mode" : "Dark Mode",
                    //   onPressed: onThemeToggle,
                    //   icon: Icon(
                    //     isDark ? Icons.light_mode : Icons.dark_mode,
                    //     color: Colors.tealAccent,
                    //     size: isMobile ? 20 : 24,
                    //   ),
                    //   padding: const EdgeInsets.all(8),
                    //   constraints: const BoxConstraints(),
                    // ),

                    // Resume button - Desktop only
                    if (!isMobile)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.document_download_copy,
                            size: 18,
                          ),
                          label: const Text("Resume"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff14B8A6),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                    // Menu/Hamburger Icon - Mobile only
                    if (isMobile)
                      Builder(
                        builder:
                            (context) => IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: const Icon(
                                Iconsax.menu_1,
                                color: Colors.white,
                                size: 24,
                              ),
                              padding: const EdgeInsets.all(8),
                              constraints: const BoxConstraints(),
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
  );
}

Widget _buildNavButton(
  String title,
  IconData icon,
  GlobalKey key,
  Function(GlobalKey) scrollToSection,
  bool isMobile,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: TextButton(
      onPressed: () => scrollToSection(key),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 18,
          vertical: isMobile ? 10 : 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: isMobile ? const Size(60, 40) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isMobile ? 16 : 18, color: Colors.white70),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
