import "dart:io";
import "dart:math";

class ColorGame {
  List<String> colors = ["Blue", "Red", "Yellow", "Green"];
  var random = Random();
  int totalPoints = 0;

  void play() {
    //game logic
    print("Welcome to the Color Game!");
    String playerColor = '';
    int points = 0;

    while (playerColor.isEmpty || !colors.contains(playerColor)) {
      //player input
      print("Please choose a color between ${colors}:");
      playerColor = stdin.readLineSync()!;

      if (!colors.contains(playerColor)) {
        // input validation
        print(
            "Invalid color. Please choose a color between ${colors.join(', ')}:");
      }
    }
    print("You have picked: $playerColor");
    // Generate 4 random colors
    List<String> aiChoice = [
      colors[random.nextInt(colors.length)],
      colors[random.nextInt(colors.length)],
      colors[random.nextInt(colors.length)],
      colors[random.nextInt(colors.length)]
    ];

    print("The winning color is... ${aiChoice.join(', ')}!");

    points = pointSystem(playerColor, aiChoice);
    totalPoints += points;
    if (points > 0) {
      print("You won $points points!");
    } else {
      print("Sorry, you lost. Try again?");
    }
  }

  int pointSystem(String playerColor, List aiChoice) {
    int matches = aiChoice.where((colors) => colors == playerColor).length;
    return matches * 25;
  }
}

void main() {
  ColorGame game = ColorGame();
  while (true) {
    game.play();
    String retry = '';
    while (retry.isEmpty || retry.toLowerCase() != 'y') {
      print("Do you want to play again?(y/n):");
      retry = stdin.readLineSync()!;
      if (retry == 'y') {
        break;
      } else if (retry == 'n') {
        print("Thanks for playing! Your final score is: ${game.totalPoints}");
        return;
      }
    }
  }
}
