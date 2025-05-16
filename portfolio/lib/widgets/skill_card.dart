import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String skill;
  final IconData icon;

  const SkillCard(this.skill, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.tealAccent),
            const SizedBox(width: 8),
            Text(skill),
          ],
        ),
      ),
    );
  }
}
