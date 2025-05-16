import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl =
      'http://localhost:5000/api/contact'; // Replace with your actual endpoint

  static Future<bool> sendContactForm({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'message': message}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint('Failed to send message: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Error sending contact form: $e');
      return false;
    }
  }
}
