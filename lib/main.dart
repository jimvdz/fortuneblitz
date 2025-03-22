import 'package:flutter/material.dart';
import 'package:fortuneblitz/screens/home/home.dart';
import 'package:fortuneblitz/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Blitz',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const Home(),
    );
  }
}