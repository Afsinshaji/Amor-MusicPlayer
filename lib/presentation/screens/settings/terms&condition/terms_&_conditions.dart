
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Terms and Conditions',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent),
      body: termsconditions(),
    );
  }
}

Widget termsconditions() {
  return const SafeArea(
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 10,
      ),
      child: Text(''' 
       1, Acceptance of Terms: By downloading, installing, or using Amor, you agree to these terms and conditions. If you do not agree to these terms, do not use the app.
      
       2, License: Amor is licensed to you, not sold. You may use the app only for personal, non-commercial purposes. You may not sell, distribute, or modify the app in any way.
      
       3, User Content: You are solely responsible for any content you upload, post, or transmit through Amor. You agree not to upload, post, or transmit any content that is offensive, illegal, or violates the rights of others.
      
       4, Intellectual Property: All intellectual property rights in Amor, including but not limited to trademarks, copyrights, and patents, belong to us. You may not use our intellectual property without our express written permission.
      
       5, Privacy: We respect your privacy and will only use your personal information as described in our Privacy Policy.
      
       6, User Conduct: You agree not to use Amor in any way that could damage, disable, or impair the app, servers, or networks connected to the app. You also agree not to interfere with any other user's use of the app.
      
       7, Termination: We may terminate your access to Amor at any time for any reason without notice.
      
       8, Disclaimers: Amor is provided "as is" without any warranty of any kind, express or implied. We do not guarantee that the app will be error-free or uninterrupted.
      
       9, Limitation of Liability: We will not be liable for any damages arising from your use of Amor, including but not limited to direct, indirect, incidental, or consequential damages.
      
       10, Governing Law: These terms and conditions will be governed by and construed in accordance with the laws of [your country/state]. Any disputes arising from these terms and conditions will be subject to the exclusive jurisdiction of the courts of [your country/state].
      
       11, Amendments: We reserve the right to amend these terms and conditions at any time without notice. Your continued use of Amor after any changes to these terms and conditions will constitute your acceptance of the changes.
      
      By using Amor, you acknowledge and agree to these terms and conditions.
      '''),
    ),
  );
}
