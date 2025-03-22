import 'colorgame.dart';
import 'jackenpoy.dart';
import 'lotto.dart';
import 'luckynumber.dart';
import 'dart:io';

import 'slotmachine.dart';

void main() {
  int totalPoints = 0;

  while (true) {
    print("\nWelcome to Fortune Blitz!");
    print("Choose a game:");
    print("1. Jack en Poy");
    print("2. Lucky Number");
    print("3. Lotto");
    print("4. Color Game");
    print("5. Slot Machine");
    print("Total Points: $totalPoints");

    stdout.write("Enter 1 or 2: ");
    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      RockPaperScissors jackenpoy = RockPaperScissors();
      jackenpoy.play();
      totalPoints += jackenpoy.points; 
    } 
    else if (choice == '2') {
      LuckyNumber luckyNumber = LuckyNumber();
      luckyNumber.play();
      totalPoints += luckyNumber.points;
    } 
    else if (choice == '3') {
      LottoGame lotto = LottoGame();
      lotto.play();
      totalPoints += lotto.totalPoints;
    } 
    else if (choice == '4') {
      ColorGame colorGame = ColorGame();
      colorGame.play();
      totalPoints += colorGame.totalPoints;
    } 
    else if (choice == '5') {
      Slotmachine slotMachine = Slotmachine();
      slotMachine.spin();
      totalPoints += slotMachine.totalPoints;
    } 
    else {
      print("Invalid choice. Please enter 1 or 2.");
      continue;
    }
  }
}