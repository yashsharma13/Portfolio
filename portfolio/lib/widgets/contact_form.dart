import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/services/api_service.dart';

class ContactForm extends StatefulWidget {
  final Uri emailUrl;
  final Uri linkedinUrl;

  const ContactForm({
    required this.emailUrl,
    required this.linkedinUrl,
    super.key,
  });

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      try {
        final success = await ApiService.sendContactForm(
          name: _nameController.text,
          email: _emailController.text,
          message: _messageController.text,
        ).timeout(const Duration(seconds: 10));

        setState(() {
          _isSending = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? 'Message sent successfully! I\'ll get back to you soon.'
                  : 'Failed to send message. Please try again.',
            ),
            backgroundColor: success ? Colors.green : Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );

        if (success) {
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        }
      } catch (e) {
        setState(() {
          _isSending = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error sending message. Please check your connection.',
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          "Have a project in mind or want to discuss opportunities? Feel free to reach out!",
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Please enter your name' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Your Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            !value!.contains('@')
                                ? 'Please enter a valid email'
                                : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'Your Message',
                      prefixIcon: Icon(Icons.message),
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Please enter your message' : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isSending ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child:
                          _isSending
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : const Text('Send Message'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.email),
              color: Colors.tealAccent,
              onPressed: () => launchUrl(widget.emailUrl),
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.phone),
              color: Colors.tealAccent,
              onPressed: () => launchUrl(Uri.parse('tel:91+8349077293')),
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.link),
              color: Colors.tealAccent,
              onPressed: () => launchUrl(widget.linkedinUrl),
            ),
          ],
        ),
      ],
    );
  }
}
