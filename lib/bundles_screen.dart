import 'package:flutter/material.dart';

class BundlesScreen extends StatelessWidget {
  const BundlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Bundles")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text("MTN 500MB - GHS 5")),
          ListTile(title: Text("MTN 1GB - GHS 10")),
          ListTile(title: Text("Telecel 1GB - GHS 9")),
        ],
      ),
    );
  }
}
