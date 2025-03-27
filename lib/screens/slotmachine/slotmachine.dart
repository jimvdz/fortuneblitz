import 'package:flutter/material.dart';
import 'package:fortuneblitz/audio/audiobutton.dart';
import 'package:fortuneblitz/theme.dart';
import 'package:fortuneblitz/controller.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:fortuneblitz/audio/audio_controller.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({super.key});

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  int tries = 7;
  int totalPoints = 0;
  final random = Random();
  List<String> slots = ['?', '?', '?'];
  final GameController gameController = Get.find();

  bool gameOver = false;

  final List<List<String>> items = [
    ["H", "A", "U"],
    ["S", "O", "C"],
    ["W", "E", "B"],
  ];

  void spin() {
    setState(() {
      // Generate new slot values
      if (tries > 0) {
        slots = List.generate(3, (index) {
          int row = random.nextInt(items.length);
          return items[row][index];
        });

        // Calculate points and update total
        int points = calculatePoints(slots);
        totalPoints += points;
        tries--;
        triesChecker();
      }
    });
  }

  void triesChecker() {
    String combinations = slots.join();
    if (combinations == "HAU" ||
        combinations == "SOC" ||
        combinations == "WEB" ||
        tries == 0) {
      showGameOverDialog();
    }
    //life checker
  }

  int calculatePoints(List<String> slots) {
    String combinations = slots.join();
    if (combinations == "HAU") {
      return 300;
    } else if (combinations == "SOC") {
      return 500;
    } else if (combinations == "WEB") {
      return 1000;
    }
    return 0;
  }

  void resetGame() {
    setState(() {
      totalPoints = 0; //resets total points
      slots = ["?", "?", "?"]; //resets the slots into their initial state
      tries = 7; //resets the tries to 5
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
                      ? 'You won $totalPoints points!'
                      : ('Game Over!\n Your total points are: $totalPoints'),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
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

  Widget buildSlotBox(String symbol) {
    final theme = myTheme;

    return Container(
      //slot machine container
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        symbol,
        style: theme.textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildSlotMachine() {
    final theme = myTheme;
    return SizedBox(
      child: Card(
        color: theme.cardTheme.color,
        child: Container(
          height: 120,
          width: 450,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "WD-302 SLOT MACHINE",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Tries left: $tries",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: slots.map((symbol) => buildSlotBox(symbol)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlayButton() {
    final theme = myTheme;
    return ElevatedButton(
      onPressed: () {
        spin();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
      ),
      child: Text(
        "PLAY",
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
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
          'SLOT MACHINE',
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
        actions: [AudioButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Center(child: SizedBox(height: 350, child: buildSlotMachine())),
            Center(
              child: SizedBox(height: 50, width: 150, child: buildPlayButton()),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
