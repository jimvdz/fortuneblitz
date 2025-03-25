import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:fortuneblitz/theme.dart";

void main() {
  runApp(Jackenpoy());
}

class Jackenpoy extends StatefulWidget {
  const Jackenpoy({super.key});

  @override
  State<Jackenpoy> createState() => _JackenpoyState();
}

class _JackenpoyState extends State<Jackenpoy> {
  final List<String> choices = ["ROCK", "PAPER", "SCISSOR"];
  String userChoice = "?";
  String computerChoice = "?";
  int score = 0;
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
        score+=50;
      });
      return "You Win!";
    } else {
      return "You Lose!";
    }
  }

  // Handles the user's move
  void playGame(String userSelection) {
    setState(() {
      userChoice = userSelection;
      computerChoice = choices[random.nextInt(3)];
      determineWinner(userChoice, computerChoice);
    });
  }

  // Resets the game
  void resetGame() {
    setState(() {
      userChoice = "?";
      computerChoice = "?";
      score = 0;
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

                  // Result and Play Again Button
                  Card(
                    
                    color: theme.cardTheme.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          
                          SizedBox(height: 10),
                          Text(
                            "You won $score points",
                            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: resetGame,
                            icon: Icon(Icons.replay, color: theme.colorScheme.onPrimary),
                            label: Text(
                              "Play again",
                              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              minimumSize: Size(210, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
