import 'dart:io';
import 'dart:math';

void main() {
  LuckyNumber game = LuckyNumber();
  while (true) {
    game.play();
    String retry = '';
    while (retry.isEmpty || retry.toLowerCase() != 'y') {
      print("Do you want to play again? (y/n):");
      retry = stdin.readLineSync()!;
      if (retry == 'y') {
        break;
      } else {
        print("Thanks for playing! Your final score is ${game.points}");
        return;
      }
    }
  }
}

class LuckyNumber {
  var random = Random();
  int points = 0;

  void play() {
    int tempPoints = 120;
    int guessNum = 0;
    int lives = 8;

    // Welcome
    print("==== Lucky Number ====");

    // Generate random number
    int rndNum = random.nextInt(100);
    print("Current num: $rndNum"); // for debugging/checking purposes; to be removed

    // Ask for input
    do {
      print('Lives left: $lives');
      stdout.write("What's your guess? ");
      guessNum = int.parse(stdin.readLineSync()!);
      print('\n${compareGuess(rndNum, guessNum)}\n');

      // Mababawasan lives and points if mali
      if (rndNum != guessNum) {
        lives--;
        tempPoints -= 15;
      }
    } while ((rndNum != guessNum) && (lives > 0));

    // Ilagay sa actual points yung galing sa temp points
    points+=tempPoints;

    // Show result ng current game
    if (lives == 0) {
      print("No lives left! You lose!");
    } else {
      print("Congratulations! You won $tempPoints points!");
    }
  }

  // Function to compare the random num and guess
  String compareGuess(int rndNum, int guessNum) {
    String comparison = "";
    String lowhigh = "";
    int difference = (rndNum - guessNum).abs();

    if (rndNum > guessNum) {
      lowhigh = "higher";

      if (difference >= 40) {
        comparison = "significantly greater";
        return getHint(comparison, guessNum, lowhigh);
      } else if (difference <= 5) {
        comparison = "slightly greater";
        return getHint(comparison, guessNum, lowhigh);
      } else {
        comparison = "greater";
        return getHint(comparison, guessNum, lowhigh);
      }
    } else if (rndNum < guessNum) {
      lowhigh = "lower";

      if (difference >= 40) {
        comparison = "significantly less";
        return getHint(comparison, guessNum, lowhigh);
      } else if (difference <= 5) {
        comparison = "slightly less";
        return getHint(comparison, guessNum, lowhigh);
      } else {
        comparison = "less";
        return getHint(comparison, guessNum, lowhigh);
      }
    } else {
      return "You got $rndNum right!";
    }
  }

  // Function to get the specific hint
  String getHint(comparison, guessNum, lowhigh) {
    return "The number is $comparison than $guessNum. Try to go $lowhigh!";
  }
}
