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
              'Getting Started',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Basic Setup',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam feugiat magna vel odio fringilla, id volutpat nisi placerat. Donec rhoncus tellus et libero efficitur molestie.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Advanced Features',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Customization',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Praesent tincidunt, nunc id suscipit ullamcorper, nunc nisi tincidunt nisi, vel hendrerit nunc nisi vel mauris. Sed ut magna non mi porta fermentum vel id nulla.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Synchronization',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pellentesque efficitur risus at turpis malesuada imperdiet. Curabitur facilisis sapien eu eros interdum, vel dapibus mi fermentum. Phasellus maximus magna eu ante posuere placerat.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Troubleshooting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Common Issues',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Etiam consectetur nisl non efficitur vehicula. Aliquam erat volutpat. Integer consectetur consectetur justo, in finibus ante mattis in. Proin felis justo, volutpat non faucibus et, facilisis nec risus.',
            ),
          ],
        ),
      ),
    );
  }
}
