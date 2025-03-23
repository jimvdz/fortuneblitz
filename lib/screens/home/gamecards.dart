// Game cards made with <3 by Jimwel L. Valdez (jimvdz). Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';

class GameCards extends StatelessWidget {
  const GameCards({super.key});

  @override
  Widget build(BuildContext context) {
    // Get yung theme sa current build
    final theme = Theme.of(context);

    // List game data para maiwasan repetitive code
    final List<Map<String, String>> games = [
      {"title": "Jack en Poy", "image": "images/placeholder.jpg"},
      {"title": "Lucky Number", "image": "images/placeholder.jpg"},
      {"title": "Lotto", "image": "images/placeholder.jpg"},
      {"title": "Color Game", "image": "images/placeholder.jpg"},
      {"title": "Slot Machine", "image": "images/placeholder.jpg"},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,

      // Dito mag-iterate para iisang template lang and no repetitive codes
      children: games.map((game) {
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
                debugPrint('${game["title"]} card tapped');
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
                  Text('${game["title"]}', style: theme.textTheme.bodyMedium),

                  // Play button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => {print("${game["title"]} Play button clicked")},
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
