import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';
import 'package:fortuneblitz/screens/home/home.dart';
import 'package:fortuneblitz/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final audioController = AudioController();
  await audioController.initialize();

  runApp(
    MultiProvider(
      providers: [Provider<AudioController>.value(value: audioController)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fortune Blitz',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const Home(),
    );
  }
}
