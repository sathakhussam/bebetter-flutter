import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Getting Started with BeBetter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'BeBetter is an innovative mobile application designed to enhance road safety by detecting traffic violations using advanced machine learning techniques.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Key Features',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Helmet Detection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Utilizing our TensorFlow Lite model, the app accurately identifies whether riders and passengers are wearing helmets. This feature is crucial for promoting helmet usage and reducing fatalities in road accidents.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Complaint Logging',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Users can easily log complaints about observed traffic violations. This feature empowers citizens to contribute to road safety by reporting infractions, which can then be addressed by relevant authorities.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Why Choose BeBetter?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cutting-edge Technology',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'BeBetter employs state-of-the-art machine learning models to ensure high accuracy in detecting traffic violations.',
            ),
            const SizedBox(height: 16),
            const Text(
              'User Empowerment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'By enabling users to report violations, the app fosters a community-driven approach to improving road safety.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Scalability',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'While currently focused on helmet detection, the app\'s architecture allows for easy expansion to detect additional types of traffic violations in the future.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Social Impact',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'BeBetter aims to reduce traffic-related injuries and fatalities, contributing to safer roads and communities.',
            ),
          ],
        ),
      ),
    );
  }
}
