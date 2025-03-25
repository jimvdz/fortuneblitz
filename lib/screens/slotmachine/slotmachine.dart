import 'package:flutter/material.dart';
import 'package:fortuneblitz/theme.dart';
import 'package:get/get.dart';
import 'dart:math';

class SlotMachine extends StatefulWidget {
  const SlotMachine({super.key});

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  int totalPoints = 0;
  final random = Random();
  List<String> slots = ['?', '?', '?'];

  final List<List<String>> items = [
    ["H", "A", "U"],
    ["S", "O", "C"],
    ["W", "E", "B"],
  ];

  void spin() {
    setState(() {
      // Generate new slot values
      slots = List.generate(3, (index) {
        int row = random.nextInt(items.length);
        return items[row][index];
      });

      // Calculate points and update total
      int points = calculatePoints(slots);
      totalPoints += points;
    });
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
    });
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
          height: 150,
          width: 450,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "WD-302 SLOT MACHINE",
                style: theme.textTheme.bodyLarge?.copyWith(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Center(child: SizedBox(height: 350, child: buildSlotMachine())),
            Center(
              child: SizedBox(height: 50, width: 150, child: buildPlayButton()),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 200,
                child: Column(
                  //Points system and play again container
                  children: [
                    Container(
                      width: 350,
                      height: 100,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
