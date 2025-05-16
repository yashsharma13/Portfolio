import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
  bool isMobile,
  GlobalKey aboutKey,
  GlobalKey projectsKey,
  GlobalKey contactKey,
  Function(GlobalKey) scrollToSection,
) {
  return AppBar(
    title:
        isMobile
            ? Align(
              alignment: Alignment.centerRight,
              child: Text(
                'YASH SHARMA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.tealAccent,
                ),
              ),
            )
            : Text(
              'YASH SHARMA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent,
              ),
            ),
    centerTitle: false,
    elevation: 0,
    automaticallyImplyLeading: isMobile,
    backgroundColor: Colors.black87,
    actions:
        isMobile
            ? null
            : [
              _buildAppBarButton("About", aboutKey, scrollToSection),
              _buildAppBarButton("Projects", projectsKey, scrollToSection),
              _buildAppBarButton("Contact", contactKey, scrollToSection),
            ],
  );
}

Widget _buildAppBarButton(
  String text,
  GlobalKey key,
  Function(GlobalKey) scrollToSection,
) {
  return TextButton(
    onPressed: () => scrollToSection(key),
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
  );
}
