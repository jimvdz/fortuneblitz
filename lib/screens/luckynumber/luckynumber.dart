// Lucky Number game made with <3 by Jimwel L. Valdez. Copyright (c) 2025. All rights reserved.

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fortuneblitz/controller.dart';

class LuckyNumber extends StatefulWidget {
  const LuckyNumber({super.key});

  @override
  State<LuckyNumber> createState() => _LuckyNumberState();
}

class _LuckyNumberState extends State<LuckyNumber> {
  final GameController gameController = Get.find();
  Random random = Random();

  int targetNumber = 0;
  int userGuess = 0;
  int lives = 8;
  int points = 0;
  String hint = '';
  
  // Holds the current input string
  String userInput = '';

  bool gameOver = false;

  // Initialize the game
  @override
  void initState() {
    super.initState();
    startGame(); 
  }

  void startGame() {
    targetNumber = random.nextInt(100);
    userInput = '??';
    lives = 8;
    points = 120;
    hint = 'Hint will show up here when you check. Good luck!';
  }

  bool isValidInput(String input) {
    return input != '??' && int.tryParse(input) != null;
  }

  void compareGuess() {
    if (userInput == '??' || !isValidInput(userInput)) {
      // Don't proceed if input is not valid
      return;
    }

    String comparison = "";
    String lowhigh = "";
    int difference = (targetNumber - userGuess).abs();

    if (targetNumber > userGuess) {
      lowhigh = "higher";

      if (difference >= 40) {
        comparison = "significantly greater";
        hint = "The number is $comparison than $userGuess. Try to go $lowhigh!";
      } else if (difference <= 5) {
        comparison = "slightly greater";
        hint = "The number is $comparison than $userGuess. Try to go $lowhigh!";
      } else {
        comparison = "greater";
        hint = "The number is $comparison than $userGuess. Try to go $lowhigh!";
      }
    } else if (targetNumber < userGuess) {
      lowhigh = "lower";

      if (difference >= 40) {
        comparison = "significantly less";
        hint = "The number is $comparison than $userGuess. Try to go $lowhigh!";
      } else if (difference <= 5) {
        comparison = "slightly less";
        hint = "The number is $comparison than $userGuess. Try to go $lowhigh!";
      } else {
        comparison = "less";
        hint = "The number is $comparison than $userGuess. Try to go $lowhigh!";
      }
    } else {
      hint = "You guessed it! $targetNumber is correct!";
      points += 20;
      showGameOverDialog();
      return;
    }

    // Deduct lives and points if wrong guess
    if (targetNumber != userGuess) {
      lives--;
      points -= 15;
    }

    // Check if game over
    if (lives == 0 || points <= 0) {
      hint = "Game Over! The correct number was $targetNumber.";
      showGameOverDialog();  // Show dialog when game ends (0 lives or 0 points)
    }
  }

  // Update user input when a number is clicked
  void onNumberClicked(int number) {
    if (userInput.length < 2) {
      setState(() {
        userInput += number.toString(); 
      });
      debugPrint('$number tapped');
    } else {
      setState(() {
        userInput = number.toString();
      });
      debugPrint('$number tapped, input reset to $userInput');
    }

    // Check if points have reached 0 and stop the game if so
    if (points <= 0) {
      hint = "Game Over! The correct number was $targetNumber.";
      setState(() {});
      showGameOverDialog();
    }
  }

  void showGameOverDialog() {
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
                  points > 0
                      ? 'You won $points points!'
                      : 'Game Over! The correct number was $targetNumber.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  gameController.addPoints(points);
                  resetGame();
                  print(gameController.totalPoints.value);
                  Get.back();
                  Get.back();
                  print("Home button clicked");
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, size: 24),
                    SizedBox(width: 12),
                    Text(
                      "Home",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  gameController.addPoints(points);
                  resetGame(); 
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.replay, size: 24),
                    SizedBox(width: 12),
                    Text(
                      "Play Again",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // Reset the game state
  void resetGame() {
    setState(() {
      startGame();
    });
  }


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
                        userInput,
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
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Distribute space between the elements
                      children: [
                        Text(
                          'Hint',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          'Lives left: $lives',
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        hint,
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
                                onNumberClicked(number);
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
                      
                      // Clear Button
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          child: SizedBox(
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                setState(() {
                                  userInput = '??';  // Clear the input
                                });
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

                      SizedBox(width: 8),

                      // Check Button
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          child: SizedBox(
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                userGuess = int.tryParse(userInput) ?? 0;
                                if (!(points <= 0)) {
                                  compareGuess();
                                }                                
                                setState(() {});
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
                    ],
                  ),
                ]
              )
            ),
            
            SizedBox(height: 48)
          ]
        )
      )
    );
  }
}