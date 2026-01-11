import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_service.dart';

class ChallengeScreen extends StatelessWidget {
  final service = FirebaseService();

  ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Challenge")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Complete Challenge (+50 Points)"),
          onPressed: () async {
            await service.completeChallenge(uid, 50);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
