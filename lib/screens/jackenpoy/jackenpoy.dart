import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:fortuneblitz/theme.dart";
import "package:fortuneblitz/controller.dart";

void main() {
  runApp(Jackenpoy());
}

class Jackenpoy extends StatefulWidget {
  const Jackenpoy({super.key});

  @override
  State<Jackenpoy> createState() => _JackenpoyState();
}

class _JackenpoyState extends State<Jackenpoy> {
  final GameController gameController = Get.find();
  final List<String> choices = ["ROCK", "PAPER", "SCISSOR"];
  String userChoice = "?";
  String computerChoice = "?";
  int totalPoints = 0;
  int lives = 5;
  final Random random = Random();

  // Determines the winner
  String determineWinner(String user, String computer) {
    if (user == computer) {
      return "It's a Draw!";
    } else if (
        (user == "ROCK" && computer == "SCISSOR") ||
        (user == "PAPER" && computer == "ROCK") ||
        (user == "SCISSOR" && computer == "PAPER")) {
      setState(() {
        totalPoints+=50;
      });
      return "You Win!";
    } else {
      setState(() {
        lives--;
      });
      return "You Lose";
    }
  }

  // Handles the user's move
  void playGame(String userSelection) {
    setState(() {
      userChoice = userSelection;
      computerChoice = choices[random.nextInt(3)];
      determineWinner(userChoice, computerChoice);
    if (lives == 0) {
      Future.delayed(Duration(milliseconds: 500), () {
        showGameOverDialog();
      });
    }
  });
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
                  gameController.addPoints(totalPoints);
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




  // Resets the game
  void resetGame() {
    setState(() {
      userChoice = "?";
      computerChoice = "?";
      totalPoints = 0;
      lives = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = myTheme;

    return MaterialApp(
      title: 'Jackenpoy',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text("JACK EN POY", style: theme.textTheme.bodyLarge),
          backgroundColor: theme.appBarTheme.backgroundColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            onPressed: () => Get.back(),
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(4),
              shape: CircleBorder(),
              backgroundColor: theme.colorScheme.secondary,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.colorScheme.onTertiary,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  
                  // Computer's Choice
                  SizedBox(
                    height: 200.0,
                    width: 378.0,
                    child: Card(
                      color: theme.cardTheme.shadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: theme.colorScheme.onPrimary, width: .0),
                      ),
                      child: Center(
                        child: Text(
                          computerChoice,
                          style: theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20.0),
                  Text("VS", style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary)),
                  SizedBox(height: 20.0),
                  
                  // User's Choice
                  SizedBox(
                    height: 200.0,
                    width: 378.0,
                    child: Card(
                      color: theme.colorScheme.secondary,
                      child: Center(
                        child: Text(
                          userChoice,
                          style: theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20.0),

                  // Buttons for selecting moves
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => playGame("PAPER"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          padding: EdgeInsets.all(21.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text("PAPER", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                      ),
                      SizedBox(width: 17),
                      ElevatedButton(
                        onPressed: () => playGame("SCISSOR"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          padding: EdgeInsets.all(21.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text("SCISSOR", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                      ),
                      SizedBox(width: 17),
                      ElevatedButton(
                        onPressed: () => playGame("ROCK"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                          padding: EdgeInsets.all(21.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        child: Text("ROCK", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                      ),
                    ],
                  ),

                  SizedBox(height: 50.0),

                      

                      Text("Lives left: $lives", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),

                  // Result and Play Again Button
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
