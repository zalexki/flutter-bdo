import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 90),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('SettingsPage')
            ],
          ),
        ],
      ),
    );
  }
}