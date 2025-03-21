import 'dart:io'; // for input
import 'dart:math'; // for generate

class LottoGame { //Class
  int totalPoints = 0; // initialize points
  
  void play() { //Method
    print("\n********* Fortune Blitz *********");

    while (true) { 
      stdout.write("Press Enter to draw your number..."); // Asking user to press enter
      stdin.readLineSync();

      int userNumber = Random().nextInt(11);  // To make generate random numbers
      int winningNumber = Random().nextInt(11);

      print("=================================");
      print("Your number: $userNumber");
      print("Winning number: $winningNumber");   //Random number generated
      print("=================================");

      if (userNumber == winningNumber) { //Points increment
        totalPoints += 50;
        print("You won 50 points! Total points: $totalPoints");
      } else {
        print("You lost this round. Try again!");
      }

      stdout.write("\nDo you want to play again? (yes/no): "); //Asking user to play again
      String? playAgain = stdin.readLineSync()?.toLowerCase();

      if (playAgain != "yes") { // Exits the loop if the user doesn't type "yes"
        print("\nGame over! Total points earned: $totalPoints");
        break;
      }
    }
    print("End of game.");
  }
}

void main() {
  LottoGame game = LottoGame(); // create an instance of the class
  game.play(); // call the play method of the instance of the class   
}
