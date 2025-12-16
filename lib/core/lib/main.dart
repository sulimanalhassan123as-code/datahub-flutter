import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(const DataHubApp());
}

class DataHubApp extends StatelessWidget {
  const DataHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Bundle Hub',
      theme: ThemeData.dark(),
      home: const AuthScreen(),
    );
  }
}
