import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String githubLink;
  final Function(Uri) onTap;

  const ProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
    required this.githubLink,
    required this.onTap,
    super.key,
  });

  //   @override
  //   Widget build(BuildContext context) {
  //     return Card(
  //       child: Padding(
  //         padding: const EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 const Icon(Icons.work, color: Colors.tealAccent),
  //                 const SizedBox(width: 8),
  //                 Expanded(
  //                   child: Text(
  //                     title,
  //                     style: const TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(Icons.code),
  //                   onPressed: () => onTap(Uri.parse(githubLink)),
  //                   tooltip: 'View on GitHub',
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 10),
  //             Text(description),
  //             const SizedBox(height: 15),
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
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.mobile_friendly,
                  color: Colors.tealAccent,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              if (githubLink.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.code, color: Colors.tealAccent),
                  onPressed: () => onTap(Uri.parse(githubLink)),
                ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            description,
            style: const TextStyle(color: Colors.white70, height: 1.7),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                technologies.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
