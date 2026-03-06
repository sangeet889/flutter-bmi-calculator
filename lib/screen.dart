import 'dart:math';

import 'package:bodymassindex/bmicalculator.dart';
import 'package:bodymassindex/result_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 20;
  int height = 120;
  double weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //AGE CONTAINER
                  Expanded(
                    child: ShadowContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 43,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                elevation: 5,
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  maxWidth: 45,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xff586ee6),
                                  size: 35,
                                ),
                              ),

                              SizedBox(width: 9),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                elevation: 5,
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  maxWidth: 45,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff586ee6),
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10),
                  //GENDER CONTAINER
                  Expanded(
                    child: ShadowContainer(
                      height: 300,
                      shadowColor: Colors.purple,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.man, size: 70),
                              Icon(Icons.woman, size: 70),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //gender container ended
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                // flex: 2,
                child: ShadowContainer(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Height ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'cm',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        RotatedBox(
                          quarterTurns: 2,
                          child: Image.asset('assets/images/meter_icon.png'),
                        ),
                        Flexible(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xff586EE6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: ListWheelScrollView.useDelegate(
                                physics: FixedExtentScrollPhysics(),
                                itemExtent: 50,
                                useMagnifier: true,
                                magnification: 1.5,
                                onSelectedItemChanged: (val) {
                                  height = val + 50;
                                  // print(height);
                                },

                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 201,
                                  builder: (context, index) {
                                    return RotatedBox(
                                      quarterTurns: 3,
                                      child: Center(
                                        child: Text(
                                          (index + 50).toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              //Weight Container
              Expanded(
                child: ShadowContainer(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Weight ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'kg',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 5),
                      Text(
                        weight.toInt().toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Slider(
                        max: 150,
                        min: 20,
                        value: weight,
                        onChanged: (val) {
                          weight = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              CustomButton(
                buttonText: 'Calculate',
                onTap: () {
                  var bmiCalculator = BmiCalculator(
                    height: height,
                    weight: weight.toInt(),
                  );

                  double calculatedBmi = bmiCalculator.calculateBmi();

                  String rating = bmiCalculator.getRating();

                  // print(rating);

                  // print(calculatedBmi);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        calculateBmi: calculatedBmi.toStringAsFixed(1),
                        rating: rating,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({required this.buttonText, this.onTap, super.key});
  final String buttonText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff586EE6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    required this.child,
    this.shadowColor = Colors.red,
    this.height,
    this.width,
    super.key,
  });

  final Widget child;
  final Color shadowColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minHeight: 150),
      padding: EdgeInsets.all(12),
      height: 200,
      width: width,

      // width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(5, 5),
            blurRadius: 19,
          ),
        ],
      ),
      child: child,
    );
  }
}
