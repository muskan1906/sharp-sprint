import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Sharp2RunApp());
}

class Sharp2RunApp extends StatelessWidget {
  const Sharp2RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sharp2run',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginScreen(),
    );
  }
}
