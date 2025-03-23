// Game cards made with <3 by Jimwel L. Valdez (jimvdz). Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';

class GameCards extends StatelessWidget {
  const GameCards({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get yung theme sa current build

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [

        // Jack en Poy
        SizedBox(
          width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(
                      'images/placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Jack en Poy', style: theme.textTheme.bodyMedium),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity, 
                    child: FilledButton(
                      onPressed: () => {print("Play button clicked")},
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
                      child: Icon(Icons.play_arrow,
                      size: 28),
                    ),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),

        // Lucky Number
        SizedBox(
          width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(
                      'images/placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Lucky Number', style: theme.textTheme.bodyMedium),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity, 
                    child: FilledButton(
                      onPressed: () => {print("Play button clicked")},
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
                      child: Icon(Icons.play_arrow,
                      size: 28),
                    ),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),

        // Lotto
        SizedBox(
          width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(
                      'images/placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Lotto', style: theme.textTheme.bodyMedium),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity, 
                    child: FilledButton(
                      onPressed: () => {print("Play button clicked")},
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
                      child: Icon(Icons.play_arrow,
                      size: 28),
                    ),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),

        // Color Game
        SizedBox(
          width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(
                      'images/placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Color Game', style: theme.textTheme.bodyMedium),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity, 
                    child: FilledButton(
                      onPressed: () => {print("Play button clicked")},
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
                      child: Icon(Icons.play_arrow,
                      size: 28),
                    ),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),

        // Slot Machine
        SizedBox(
          width: (MediaQuery.of(context).size.width - 40 - 12) / 2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(
                      'images/placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Slot Machine', style: theme.textTheme.bodyMedium),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity, 
                    child: FilledButton(
                      onPressed: () => {print("Play button clicked")},
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
                      child: Icon(Icons.play_arrow,
                      size: 28),
                    ),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
