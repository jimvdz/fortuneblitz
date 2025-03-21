import 'luckynumber.dart';
import 'dart:io';

void main() {
  int totalPoints = 0;

  while (true) {
    print("\nWelcome to Fortune Blitz!");
    print("Choose a game:");
    print("1. Lucky Number");
    print("2. exit");
    print("Total Points: $totalPoints");

    stdout.write("Enter 1 or 2: ");
    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      LuckyNumber luckyNumber = LuckyNumber();
      luckyNumber.play();
      totalPoints += luckyNumber.points; 
    } 
    else if (choice == '2') {
      break; // dito mapupunta other games
    } 
    else {
      print("Invalid choice. Please enter 1 or 2.");
      continue;
    }
  }
}