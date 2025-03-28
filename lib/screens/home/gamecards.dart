// Game cards made with <3 by Jimwel L. Valdez (jimvdz). Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:fortuneblitz/screens/colorgame/colorgame.dart';
import 'package:fortuneblitz/screens/luckynumber/luckynumber.dart';
import 'package:fortuneblitz/screens/slotmachine/slotmachine.dart';
import 'package:fortuneblitz/screens/jackenpoy/jackenpoy.dart';
import 'package:fortuneblitz/screens/lotto/lotto.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';

class GameCards extends StatelessWidget {
  const GameCards({super.key});

  @override
  Widget build(BuildContext context) {
    // Get yung theme sa current build
    final theme = Theme.of(context);
    final audioController = Provider.of<AudioController>(context, listen: false);

    // List game data para maiwasan repetitive code
    final List<Map<String, dynamic>> games = [
      {
        "title": "Jack en Poy",
        "image": "assets/images/games/jackenpoy.png",
        "page": Jackenpoy(),
      },
      {
        "title": "Lucky Number",
        "image": "assets/images/games/luckynumber.png",
        "page": LuckyNumber(),
      },
      {
        "title": "Lotto",
        "image": "assets/images/games/lotto.png",
        "page": Lotto(),
      },
      {
        "title": "Color Game",
        "image": "assets/images/games/colorgame.png",
        "page": ColorGame(),
      },
      {
        "title": "Slot Machine",
        "image": "assets/images/games/slotmachine.png",
        "page": SlotMachine(),
      },
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,

      // Dito mag-iterate para iisang template lang and no repetitive codes
      children:
          games.map((game) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: theme.colorScheme.tertiary.withAlpha(30),
                  onTap: () {
                    audioController.playSound('click.mp3');
                    final Widget nextPage = game["page"];
                    Get.to(() => nextPage);
                  },
                  child: Column(
                    spacing: 8,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Game image
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8.0),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Image.asset(
                            '${game["image"]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Game title
                      Text(
                        '${game["title"]}',
                        style: theme.textTheme.bodyMedium,
                      ),

                      // Play button
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              audioController.playSound('click.mp3');
                              final Widget nextPage = game["page"];
                              Get.to(() => nextPage);
                            },
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 12.0),
                              ),
                            ),
                            child: Icon(Icons.play_arrow, size: 24),
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
