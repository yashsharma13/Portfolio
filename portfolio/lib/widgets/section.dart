import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({required Key key, required this.title, required this.child})
    : super(key: key); // Assign key here to the Section widget

  @override
  Widget build(BuildContext context) {
    return Container(
      // No key here
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}
