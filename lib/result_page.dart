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
                          color: Colors.green,
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
                        'You have a normal body weight.Good job',
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
            ],
          ),
        ),
      ),
    );
  }
}
