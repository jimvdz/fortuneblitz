// Homepage made with <3 by Jimwel L. Valdez (jimvdz). Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuneblitz/screens/home/gamecards.dart';
import 'package:fortuneblitz/screens/credits/credits.dart';
import 'package:get/get.dart';
import 'package:fortuneblitz/controller.dart';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final GameController gameController = Get.put(GameController());

  void showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Are you sure to reset score?',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  gameController.resetPoints();
                  print("Reset score clicked");
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  ),
                ),
                child: Text(
                  "Yes, reset",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get yung theme sa current build
    final audioController = Provider.of<AudioController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FORTUNE BLITZ', style: theme.textTheme.bodyLarge),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/info.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            onPressed: () {
              audioController.playSound('click.mp3');
              print("Credits clicked");
              Get.to(() => const Credits());
            },
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Transform.scale(
              scale: 0.92,
              child: IconButton(
                icon: Icon(
                  audioController.isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 20
                ),
                onPressed: () {
                  setState(() {
                    audioController.isMuted = !audioController.isMuted;
                    if (audioController.isMuted) {
                      audioController.stopMusic();
                      audioController.mute(true);
                    } else {
                      audioController.startMusic();
                      audioController.mute(false);
                    }
                  });
                },
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(0),
                  fixedSize: const Size(20, 20)
                ),
              ),
            )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 48,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Points sa taas ng screen
              Container(
                margin: const EdgeInsets.only(top: 56),
                child: Column(
                  spacing: 8,
                  children: [
                    Text('CURRENT POINTS', style: theme.textTheme.bodyLarge),
                    Obx(() {
                      return Text(
                        '${gameController.totalPoints.value}',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: theme.colorScheme.tertiary
                        ),
                      );
                    }),
                    SizedBox(height: 4), // for spacing kasi may leading yung texts
                    FilledButton(
                      onPressed: () {
                        print("Reset score clicked");
                        showConfirmationDialog();
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'Reset Score',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),

              // For cards containing the games
              Container(
                margin: const EdgeInsets.only(bottom: 56, left: 20, right: 20),
                child: GameCards(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
