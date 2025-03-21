import 'dart:io';
import 'dart:math';

class Slotmachine {
  int totalPoints = 0;
  var random = Random();

  final List<List<String>> items = [
    ["H", "A", "U"],
    ["W", "E", "B"],
    ["S", "O", "C"],
  ];
  void spin() {
    print("Welcome to the WD 302 Slot Machine!");
    print("Try to match the symbols to win!");

    //generate random symbols
    List<String> slots = List.generate(3, (index) {
      int row = random.nextInt(items.length);
      return items[row][index];
    });

    // display winning combinations
    print("${slots[0]} | ${slots[1]} | ${slots[2]}");

    int points = calculatePoints(slots);
    totalPoints += points;

    if (points > 0) {
      print("You won $points points!");
    } else {
      print("Sorry you lost. Try again!");
    }

    print("Total number of points: ${totalPoints}");
  }

  //point system function
  int calculatePoints(List<String> slots) {
    if (slots.join() == "HAU") {
      return 200;
    } else if (slots.join() == "SOC") {
      return 500;
    } else if (slots.join() == "WEB") {
      return 1000;
    }
    return 0;
  }
}

void main() {
  Slotmachine game = Slotmachine();

  while (true) {
    stdout.write("Press ENTER to play or type 'exit' to quit: ");
    String? userInput = stdin.readLineSync()!;

    if (userInput == 'exit') {
      print("Thanks for playing! Your final score is: ${game.totalPoints}");
      break;
    }
    game.spin();
  }
}
