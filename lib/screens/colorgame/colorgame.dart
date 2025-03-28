import 'package:flutter/material.dart';
import 'package:fortuneblitz/audio/audiobutton.dart';
import 'package:fortuneblitz/theme.dart';
import 'package:fortuneblitz/controller.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';

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
  int lives = 5;
  final GameController gameController = Get.find();

  bool gameOver = false;

  void playGame(String chosenColor) {
    setState(() {
      playerChoice = chosenColor;
      aiChoices = [
        colors[random.nextInt(colors.length)],
        colors[random.nextInt(colors.length)],
        colors[random.nextInt(colors.length)],
        colors[random.nextInt(colors.length)],
      ];

      if (!aiChoices.contains(playerChoice)) {
        lives--;
        livesChecker();
      }
      roundPoints = pointSystem(playerChoice!, aiChoices);
      totalPoints += roundPoints;
    });
  }

  void livesChecker() {
    //life checker
    if (lives == 0) {
      showGameOverDialog();
    }
  }

  int pointSystem(String playerColor, List<String> aiChoices) {
    int matches = aiChoices.where((color) => color == playerColor).length;
    return matches * 25;
  }

  void resetGame() {
    setState(() {
      totalPoints = 0;
      roundPoints = 0;
      aiChoices.clear();
      lives = 5;
      playerChoice = null;
    });
  }

  void showGameOverDialog() {
    final audioController = Provider.of<AudioController>(context, listen: false);
    if (roundPoints > 0) {audioController.playSound('win.mp3');}
    else {audioController.playSound('gameover.mp3');}
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
                  roundPoints > 0
                      ? 'You won $roundPoints points!'
                      : 'Game Over!\n Your total points are: $totalPoints',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  audioController.playSound('click.mp3');
                  gameController.addPoints(totalPoints);
                  resetGame();
                  Get.back();
                  Get.back();
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, size: 24),
                    SizedBox(width: 12),
                    Text("Home", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  audioController.playSound('click.mp3');
                  gameController.addPoints(totalPoints);
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
    final audioController = Provider.of<AudioController>(context, listen: false);

    return ElevatedButton(
      onPressed: () {
        audioController.playSound('click.mp3');
        playGame(color);
        },
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
    final audioController = Provider.of<AudioController>(context, listen: false);

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
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            onPressed: () {
              audioController.playSound('click.mp3');
              Get.back();
            },
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              shape: CircleBorder(),
              padding: EdgeInsets.all(4),
            ),
          ),
        ),
        actions: [AudioButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //start of color game container
            SizedBox(height: 40),
            Text(
              "CHOOSE YOUR COLOR",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Lives left: $lives",
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
              height: 120,
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
            Text(
              playerChoice == null
                  ? ""
                  : !aiChoices.contains(playerChoice)
                  ? "No matches this time. Try again!"
                  : "You won $roundPoints points!",
            ),
          ],
        ),
      ),
    );
  }
}
