import 'package:get/get.dart';

class GameController extends GetxController {
  var totalPoints = 0.obs;  // Observed variable for totalPoints

  // Function to update points
  void addPoints(int points) {
    totalPoints.value += points;
  }

  void resetPoints() {
    totalPoints.value = 0;
  }
}