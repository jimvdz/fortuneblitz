// Audio button functionality made with <3 by Jimwel Valdez. Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';

class AudioButton extends StatefulWidget {
  const AudioButton({super.key});

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final audioController = Provider.of<AudioController>(context, listen: false);
    

    return Padding(
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
    );
  }
}