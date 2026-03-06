import 'package:bodymassindex/screen.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.calculateBmi,
    required this.rating,
    super.key,
  });

  final String calculateBmi;
  final String rating;

  Color _ratingColor() {
    switch (rating) {
      case 'Obese':
        return Colors.red;
      case 'Overweight':
        return Colors.orange;
      case 'Normal':
        return Colors.green;
      case 'Underweight':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  String _ratingMessage() {
    switch (rating) {
      case 'Obese':
        return 'Consider consulting a doctor for a health plan.';
      case 'Overweight':
        return 'Try to maintain a balanced diet and exercise.';
      case 'Normal':
        return 'You have a normal body weight. Good job!';
      case 'Underweight':
        return 'Try to eat more nutritious meals to gain weight.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 30),

              Expanded(
                child: ShadowContainer(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _ratingColor(),
                        ),
                      ),
                      Text(
                        calculateBmi,
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _ratingMessage(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonText: 'Re Calculate',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
