import 'package:flutter/material.dart';
import 'package:fortuneblitz/audio/audiobutton.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:fortuneblitz/theme.dart';
import 'package:fortuneblitz/controller.dart';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';

class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}
class _LottoState extends State<Lotto> { 
  final GameController gameController = Get.find();
  int userNumber = 0; 
  int winningNumber = 0; 
  int totalPoints = 0;
  int lives = 5;
  final random = Random();

  void drawNumber() {
    setState(() {
      userNumber = random.nextInt(11); // Generates a number from 0-10
      winningNumber = random.nextInt(11);
      
      // If user wins, add points
      if (userNumber == winningNumber) {
        totalPoints += 100;
        showGameOverDialog();
        
      }else{
      lives--;
      }
      if(lives == 0){
        showGameOverDialog();      
        }
    });
  }

void showGameOverDialog() {
    final audioController = Provider.of<AudioController>(context, listen: false);
    if (totalPoints > 0) {
      audioController.playSound('win.mp3');
    }
    else {
      audioController.playSound('gameover.mp3');
    }
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
                  totalPoints > 0
                      ? 'You won $totalPoints points! ' 
                      : 'Game Over! \n You won $totalPoints points',
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

  void resetGame() {
    setState(() {
      userNumber = 0;
      winningNumber = 0;
      totalPoints = 0;
      lives = 5;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = myTheme;
    final audioController = Provider.of<AudioController>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
        title: Text(
          "LOTTO",
          style: theme.textTheme.bodyLarge,
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            onPressed: () {
              audioController.playSound('click.mp3');
              Get.back();
              },
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(4),
              shape: CircleBorder(),
              backgroundColor: theme.colorScheme.secondary,
            ),
          ),
        ),

        actions: [AudioButton()],
      ),

          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.colorScheme.onTertiary, 
            child: Column(
              children: [
              Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      "YOUR NUMBER IS",
                      style: theme.textTheme.bodyLarge,
                    ),

                    SizedBox(height: 10.0),

                    SizedBox(
                      height: 150.0,
                      width: 210.0,
                      child: Card(
                        color: theme.colorScheme.tertiary,
                        child: Center(
                          child: Text(
                          "$userNumber",

                            style: theme.textTheme.displayLarge?.copyWith(color: theme.colorScheme.surface),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    ElevatedButton(
                      onPressed: () {
                        drawNumber();
                        audioController.playSound('click.mp3');
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        minimumSize: const Size(210, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: Text(
                        "Draw",
                        style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onError),
                      ),
                    ),

                    SizedBox(height: 70.0),

                    Text(
                      "WINNING NUMBER",
                      style: theme.textTheme.bodyLarge,
                    ),

                    SizedBox(height: 10.0),

                    SizedBox(
                      height: 150.0,
                      width: 210.0,
                      child: Card(
                        color: theme.colorScheme.tertiary,
                        child: Center(
                          child: Text(
                          "$winningNumber",
                            style: theme.textTheme.displayLarge?.copyWith(color: theme.colorScheme.surface),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 50),
                    Text("Lives left: $lives", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
