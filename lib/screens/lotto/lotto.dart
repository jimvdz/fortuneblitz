import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:fortuneblitz/theme.dart';


class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}

class _LottoState extends State<Lotto> { 
  int userNumber = 0; 
  int winningNumber = 0; 
  int totalPoints = 0;
  final random = Random();

  void drawNumber() {
    setState(() {
      userNumber = random.nextInt(11); // Generates a number from 0-10
      winningNumber = random.nextInt(11);
      
      // If user wins, add points
      if (userNumber == winningNumber) {
        totalPoints += 50;
      }
    });
  }

  void resetGame() {
    setState(() {
      userNumber = 0;
      winningNumber = 0;
      totalPoints = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = myTheme;

    return MaterialApp(
      title:'Lotto',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: Scaffold(

       appBar: AppBar(
          title: Text(
            "LOTTO",
            style: theme.textTheme.bodyLarge,
            ),
            backgroundColor: theme.appBarTheme.backgroundColor,
            centerTitle: true,

          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
            
            onPressed: () {
              print("Back button clicked");
              Get.back();
            },
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(4),
              shape: CircleBorder(),
              backgroundColor: theme.colorScheme.secondary,
            )
          ),
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
                            userNumber == 0 ? "?" : "$userNumber",

                              style: theme.textTheme.displayLarge?.copyWith(color: theme.colorScheme.surface),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      ElevatedButton(
                        onPressed: drawNumber,
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
                            winningNumber == 0 ? "?" : "$winningNumber",
                              style: theme.textTheme.displayLarge?.copyWith(color: theme.colorScheme.surface),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 50),

                      Card(
                        color: theme.cardTheme.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "You won $totalPoints points",
                                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary),
                              ),

                              SizedBox(height: 10),

                              ElevatedButton.icon(
                                onPressed: resetGame,
                                icon: Icon(Icons.replay, color: theme.colorScheme.onPrimary),
                                label: Text(
                                  "Play again",
                                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimary),
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
            ],
          ),
        )
      )
    );
  }
}
