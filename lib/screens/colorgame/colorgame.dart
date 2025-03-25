import 'package:flutter/material.dart';
import 'package:fortuneblitz/theme.dart';
import 'package:get/get.dart';
import 'dart:math';

class ColorGame extends StatefulWidget {
  const ColorGame({super.key});

  @override
  State<ColorGame> createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  List<String> colors = ["Blue", "Red", "Yellow", "Green"];
  var random = Random();
  String? playerChoice;
  List<String> aiChoices = [];
  int totalPoints = 0;
  int roundPoints = 0;

  void playGame(String chosenColor) {
    setState(() {
      playerChoice = chosenColor;
      aiChoices = [
        colors[random.nextInt(colors.length)],
        colors[random.nextInt(colors.length)],
        colors[random.nextInt(colors.length)],
        colors[random.nextInt(colors.length)],
      ];

      roundPoints = pointSystem(playerChoice!, aiChoices);
      totalPoints += roundPoints;
    });
  }

  int pointSystem(String playerColor, List<String> aiChoices) {
    int matches = aiChoices.where((color) => color == playerColor).length;
    return matches * 25;
  }

  void resetGame() {
    setState(() {
      totalPoints = 0;
      aiChoices.clear();
    });
  }

  Widget buildColorBox(String colorName) {
    Map<String, Color> colorMap = {
      "Red": Colors.red,
      "Blue": Colors.blue,
      "Yellow": Colors.yellow,
      "Green": Colors.green,
    };
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: colorMap[colorName],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget buildColorButton(String color) {
    final theme = myTheme;
    return ElevatedButton(
      onPressed: () => playGame(color),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(
        color,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'COLOR GAME',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            onPressed: () {
              Get.back();
            },
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              shape: CircleBorder(),
              padding: EdgeInsets.all(4),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //start of color game container
            SizedBox(height: 5),
            Text(
              "CHOOSE YOUR COLOR",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Container(
                height: 250,
                width: 250,
                alignment: Alignment.center,
                child: Center(
                  child: SizedBox(
                    width: 270,
                    height: 280,
                    child: GridView.count(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                      children:
                          aiChoices.isNotEmpty
                              ? aiChoices
                                  .map((color) => buildColorBox(color))
                                  .toList()
                              : [
                                buildColorBox("Blue"),
                                buildColorBox("Red"),
                                buildColorBox("Yellow"),
                                buildColorBox("Green"),
                              ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 300,
              height: 175,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3,
                children: [
                  buildColorButton("Red"),
                  buildColorButton("Yellow"),
                  buildColorButton("Blue"),
                  buildColorButton("Green"),
                ],
              ),
            ),
            Column(
              //Points system and play again container
              children: [
                Container(
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "You have $totalPoints points!", //not sure if round or total points ang lalagay
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          resetGame();
                        },
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 24.0,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.replay, size: 24),
                              SizedBox(width: 12),
                              Text(
                                "Play Again",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
