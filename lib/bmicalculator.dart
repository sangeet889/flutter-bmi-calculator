import 'dart:math';

class BmiCalculator {
  BmiCalculator({required this.height, required this.weight});

  final int height;
  final int weight;

  double bmi = 0;
  double calculateBmi() {
    double bmi = weight / pow(height / 100, 2);

    return bmi;
  }

  String getRating() {
    double bmi = calculateBmi();
    if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
}
