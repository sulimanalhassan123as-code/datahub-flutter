import 'package:flutter/material.dart';
import '../api.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final phone = TextEditingController();
  final password = TextEditingController();
  String status = "";

  void register() async {
    final res = await ApiService.register(phone.text, password.text);
    setState(() {
      status = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Data Bundle Hub", style: TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            TextField(controller: phone, decoration: const InputDecoration(labelText: "Phone")),
            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: register, child: const Text("REGISTER")),
            const SizedBox(height: 10),
            Text(status),
          ],
        ),
      ),
    );
  }
}
