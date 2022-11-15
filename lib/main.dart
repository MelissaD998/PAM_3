import 'package:flutter/material.dart';
import 'package:quiz_lab3/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAM_Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const WelcomeScreen(),
    );
  }
}
