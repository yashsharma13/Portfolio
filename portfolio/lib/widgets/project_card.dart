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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.work, color: Colors.tealAccent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  onPressed: () => onTap(Uri.parse(githubLink)),
                  tooltip: 'View on GitHub',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(description),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  technologies
                      .map(
                        (tech) => Chip(
                          label: Text(tech),
                          backgroundColor: Colors.teal.withOpacity(0.2),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
