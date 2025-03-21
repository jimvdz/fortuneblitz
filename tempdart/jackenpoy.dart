import 'dart:io'; // for input
import 'dart:math'; // for generate

class RockPaperScissors { //Class
  List<String> signs = ["rock", "paper", "scissors"]; //List of signs
  int points = 0; // initialize points

  void play() { //Method
    print("\n********* Jack En Poy *********");

    while (true) {
      stdout.write("\nEnter your choice (Rock, Paper, Scissors) or 'exit' to quit: "); //Asking user to enter choice
      String? userChoice = stdin.readLineSync()?.toLowerCase(); 

      if (userChoice == 'exit') { // Exits the loop if the user types 'exit'
        print("\nGame Over! Total points: $points"); 
        break;
      }

      String computerChoice = signs[Random().nextInt(3)]; // To make generate random signs
      print("Computer chose: $computerChoice"); 

      if (userChoice == computerChoice) { //If user and computer choice is same
        print("It's a draw!");
      } else if ((userChoice == 'rock' && computerChoice == "scissors") || 
                 (userChoice == 'paper' && computerChoice == "rock") || 
                 (userChoice == 'scissors' && computerChoice == "paper")) { 
        points += 50; //Points increment
        print("You win! +50 points. Total points: $points"); //Points earned
      } else {
        print("You lose! Try again!"); //If user choice is not same as computer choice
      }
    }
  }
}

void main() { 
  RockPaperScissors game = RockPaperScissors(); // create an instance of the class
  game.play(); // call the play method
}
