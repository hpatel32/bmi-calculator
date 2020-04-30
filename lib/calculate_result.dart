import 'dart:math';

class CalculateResult {
  final int height;
  final int weight;

  CalculateResult({this.height, this.weight});

  String CalculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    double bmi = weight / pow(height / 100, 2);
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else
      return "Underweight";
  }

  String Interpretetion() {
    double bmi = weight / pow(height / 100, 2);
    if (bmi >= 25) {
      return "You have higher than normal body weight. Try to exercise more.";
    } else if (bmi > 18.5) {
      return "You have normal body weight. Good Job!";
    } else
      return "You have a lower than normal body weight. You can eat bit more.";
  }
}
