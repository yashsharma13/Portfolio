// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactForm extends StatefulWidget {
//   final Uri emailUrl;
//   final Uri linkedinUrl;

//   const ContactForm({
//     required this.emailUrl,
//     required this.linkedinUrl,
//     super.key,
//   });

//   @override
//   State<ContactForm> createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();
//   bool _isSending = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   Future<void> _sendToWhatsApp() async {
//     final String message = '''
// *New Portfolio Contact*

// 👤 Name: ${_nameController.text}
// 📧 Email: ${_emailController.text}

// 💬 Message:
// ${_messageController.text}
// ''';

//     final Uri whatsappUrl = Uri.parse(
//       'https://wa.me/918349077293?text=${Uri.encodeComponent(message)}',
//     );

//     await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;

//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: const Color(0xff111827),
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: Colors.white10),
//       ),
//       child:
//           isMobile
//               ? Column(
//                 children: [
//                   _buildContactInfo(),
//                   const SizedBox(height: 30),
//                   _buildForm(),
//                 ],
//               )
//               : Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(flex: 4, child: _buildContactInfo()),
//                   const SizedBox(width: 40),
//                   Expanded(flex: 6, child: _buildForm()),
//                 ],
//               ),
//     );
//   }

//   Widget _buildContactInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Let's Connect",
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),

//         const SizedBox(height: 15),

//         const Text(
//           "Looking for a Flutter Developer? Have a project idea? Feel free to reach out.",
//           style: TextStyle(color: Colors.white70, height: 1.7),
//         ),
//       ],
//     );
//   }

//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           _buildInput(
//             controller: _nameController,
//             hint: "Full Name",
//             icon: Icons.person_outline,
//           ),

//           const SizedBox(height: 20),

//           _buildInput(
//             controller: _emailController,
//             hint: "Email Address",
//             icon: Icons.email_outlined,
//           ),

//           const SizedBox(height: 20),

//           _buildInput(
//             controller: _messageController,
//             hint: "Tell me about your project...",
//             icon: Icons.chat_outlined,
//             maxLines: 6,
//           ),

//           const SizedBox(height: 25),

//           SizedBox(
//             width: double.infinity,
//             height: 45,
//             child: ElevatedButton(
//               onPressed: _sendToWhatsApp,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//               ),
//               child: const Text(
//                 "Send Message",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.email),
//                 color: Colors.tealAccent,
//                 onPressed: () => launchUrl(widget.emailUrl),
//               ),

//               const SizedBox(width: 12),

//               IconButton(
//                 icon: const Icon(Icons.link),
//                 color: Colors.tealAccent,
//                 onPressed: () => launchUrl(widget.linkedinUrl),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInput({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     int maxLines = 1,
//   }) {
//     return TextFormField(
//       controller: controller,
//       maxLines: maxLines,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white38),
//         prefixIcon: Icon(icon, color: Colors.tealAccent),
//         filled: true,
//         fillColor: const Color(0xff1F2937),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: const BorderSide(color: Colors.tealAccent),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _sendToWhatsApp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSending = true);

    final String message = '''
Hello Yash,

My name is ${_nameController.text} and I came across your portfolio.

${_messageController.text}

Looking forward to your response.

Best regards,
${_nameController.text}
Email: ${_emailController.text}
''';

    final Uri whatsappUrl = Uri.parse(
      'https://wa.me/918349077293?text=${Uri.encodeComponent(message)}',
    );

    try {
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to open WhatsApp. Please try again.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 30),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
        border: Border.all(color: Colors.white10),
      ),
      child:
          isMobile || isTablet
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactInfo(isMobile, screenWidth),
                  SizedBox(height: isMobile ? 24 : 30),
                  _buildForm(isMobile, screenWidth),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: _buildContactInfo(isMobile, screenWidth),
                  ),
                  const SizedBox(width: 40),
                  Expanded(flex: 6, child: _buildForm(isMobile, screenWidth)),
                ],
              ),
    );
  }

  Widget _buildContactInfo(bool isMobile, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Connect",
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: isMobile ? 12 : 20),
        Text(
          isMobile
              ? "Have a project in mind? Let's discuss how I can help bring your ideas to life."
              : "Looking for a Flutter Developer to build exceptional mobile experiences? Have a project in mind? Let's discuss how I can help bring your ideas to life.",
          style: TextStyle(
            color: Colors.white70,
            height: 1.8,
            fontSize: isMobile ? 14 : 16,
            letterSpacing: 0.3,
          ),
        ),
        if (isMobile) ...[
          const SizedBox(height: 24),
          _buildSocialButtons(isMobile, screenWidth),
        ],
      ],
    );
  }

  Widget _buildForm(bool isMobile, double screenWidth) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInput(
            controller: _nameController,
            hint: "Full Name",
            icon: Icons.person_outline,
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 16 : 20),
          _buildInput(
            controller: _emailController,
            hint: "Email Address",
            icon: Icons.email_outlined,
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 16 : 20),
          _buildInput(
            controller: _messageController,
            hint: "Tell me about your project...",
            icon: Icons.chat_outlined,
            maxLines: isMobile ? 5 : 6,
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 24 : 28),
          _buildSendButton(isMobile, screenWidth),
          if (!isMobile) ...[
            const SizedBox(height: 20),
            _buildSocialButtons(isMobile, screenWidth),
          ],
        ],
      ),
    );
  }

  Widget _buildSendButton(bool isMobile, double screenWidth) {
    return SizedBox(
      width: double.infinity,
      height: isMobile ? 50 : 55,
      child: ElevatedButton(
        onPressed: _isSending ? null : _sendToWhatsApp,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff14B8A6),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isMobile ? 12 : 14),
          ),
          elevation: 0,
          disabledBackgroundColor: Colors.grey[700],
        ),
        child:
            _isSending
                ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      "Send Message",
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildSocialButtons(bool isMobile, double screenWidth) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 8 : 12,
      runSpacing: isMobile ? 8 : 12,
      children: [
        _buildSocialButton(
          icon: Icons.email_outlined,
          label: 'Email',
          onPressed: () => launchUrl(widget.emailUrl),
          isMobile: isMobile,
        ),
        _buildSocialButton(
          icon: Icons.work_outline,
          label: 'LinkedIn',
          onPressed: () => launchUrl(widget.linkedinUrl),
          isMobile: isMobile,
        ),
        _buildSocialButton(
          icon: Icons.chat_outlined,
          label: 'WhatsApp',
          onPressed: () {
            final Uri whatsappUrl = Uri.parse('https://wa.me/918349077293');
            launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
          },
          isMobile: isMobile,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isMobile,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 18,
            vertical: isMobile ? 8 : 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.tealAccent, size: isMobile ? 16 : 20),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    required bool isMobile,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        if (hint == "Email Address") {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white38,
          fontSize: isMobile ? 14 : 15,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(icon, color: Colors.tealAccent, size: isMobile ? 20 : 22),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 44),
        filled: true,
        fillColor: const Color(0xff1F2937),
        contentPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 18,
          vertical: isMobile ? 14 : 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 12 : 14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 12 : 14),
          borderSide: const BorderSide(color: Color(0xff14B8A6), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 12 : 14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 12 : 14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
