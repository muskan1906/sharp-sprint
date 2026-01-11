import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final service = FirebaseService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sharp2run Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await service.login(emailController.text, passController.text);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
