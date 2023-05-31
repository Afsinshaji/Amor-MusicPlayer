import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            const Text('Privacy Policy', style: TextStyle(color: Colors.white)),
      ),
      body: privacypolicy(),
    );
  }
}

Widget privacypolicy() {
  return SafeArea(
      child: SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: const Text('''
      At Amor, we are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and disclose your personal information when you use our music player app.
      
      Information We Collect:
      
      When you use Amor, we may collect the following information:
      
      Device Information: We collect information about the device you use to access Amor, including the device's unique identifier, operating system, and version.
      
      Usage Information: We collect information about how you use Amor, including the songs you play, how long you listen to them, and your interactions with the app.
      
      Personal Information: We may collect personal information, such as your name and email address, when you sign up for our newsletter or contact us for support.
      
      How We Use Your Information:
      
      We use your information to provide and improve Amor, as well as for the following purposes:
      
      To personalize your experience with Amor
      To communicate with you about updates and new features
      To analyze how users use Amor and to improve our app
      To respond to your inquiries and support requests
      How We Share Your Information:
      
      We do not sell, trade, or rent your personal information to third parties. However, we may share your information in the following circumstances:
      
      With your consent
      With our service providers who help us operate Amor
      To comply with applicable laws, regulations, or legal processes
      To protect our rights, property, or safety or that of others
      Data Security:
      
      We take reasonable measures to protect your information from unauthorized access, alteration, or destruction. However, no data transmission over the Internet or wireless network can be guaranteed to be 100% secure.
      
      Data Retention:
      
      We retain your personal information for as long as necessary to provide you with Amor and to comply with our legal obligations.
      
      Changes to this Privacy Policy:
      
      We may update this Privacy Policy from time to time. We encourage you to review this Privacy Policy periodically for any changes. Your continued use of Amor after any changes to this Privacy Policy will constitute your acceptance of the changes.
      
      Contact Us:
      
      If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at [contact email]
      '''),
    ),
  ));
}
