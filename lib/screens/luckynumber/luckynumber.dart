// Lucky Number game made with <3 by Jimwel L. Valdez. Copyright (c) 2025. All rights reserved.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuckyNumber extends StatefulWidget {
  const LuckyNumber({super.key});

  @override
  State<LuckyNumber> createState() => _LuckyNumberState();
}

class _LuckyNumberState extends State<LuckyNumber> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LUCKY NUMBER', style: theme.textTheme.bodyLarge),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            onPressed: () {
              print("Back button clicked");
              Get.back();
            },
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(4),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Guess the Number and number itself
            Container(
              margin: const EdgeInsets.only(top: 56, left: 20, right: 20),
              child: Column(
                spacing: 20,
                children: [
                  Center(
                    child: Text(
                      'GUESS THE NUMBER',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Card(
                    color: theme.colorScheme.tertiary,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
                      child: Text(
                        '96',
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: theme.colorScheme.onTertiary
                        ),
                      )
                    )
                  ),
                ],
              ),
            ),

            // Hint
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'Hint',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 8),
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        'The number is less than 96. Try to go lower!',
                        style: theme.textTheme.bodyMedium
                        ),
                      )
                    ),
                ]
              )
            ),

            // User buttons
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 8,
                children: [

                  // Number inputs
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    alignment: WrapAlignment.center,
                    children: List.generate(10, (index) {
                      int number = (index == 9) ? 0 : index + 1;
                      double cardWidth = (MediaQuery.of(context).size.width - 40 - (4 * 4)) / 5;

                      // Magpapalit ng kulay depende sa number
                      Color cardColor = (number % 2 == 1)
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.surfaceContainerHighest;

                      return SizedBox(
                        width: cardWidth,
                        child: Card(
                            color: cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              splashColor: theme.colorScheme.tertiary.withAlpha(30),
                              onTap: () {
                                debugPrint('$number tapped');
                              },
                              child: Container(
                              height: cardWidth - 16,
                              alignment: Alignment.center,
                              child: Text(
                                '$number',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: 4),

                  // Clear and Check buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      // Check Button
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          child: SizedBox(
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                print("Check button clicked");
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                ),
                              ),
                              child: Text(
                                "Check",
                                style: theme.textTheme.bodyMedium
                                ),
                            ),
                          ),
                        )
                      ),

                      SizedBox(width: 8),

                      // Clear Button
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          child: SizedBox(
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                print("Clear button clicked");
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                ),
                              ),
                              child: Text(
                                "Clear",
                                style: theme.textTheme.bodyMedium
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ]
              )
            ),
            
            Card(
              child: Container(
                width: (MediaQuery.of(context).size.width - 40) * 0.7,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Center(
                      child: Text(
                        'You won 75 points!',
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FilledButton(
                      onPressed: () => {print("Play again button clicked")},
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.replay, size: 24),
                          SizedBox(width: 12),
                          Text(
                            "Play Again",
                            style: theme.textTheme.bodyMedium
                            ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ),
            SizedBox(height: 48)
          ]
        )
      )
    );
  }
}