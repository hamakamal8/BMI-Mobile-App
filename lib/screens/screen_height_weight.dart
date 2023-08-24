import 'dart:math';

import 'package:bmi/components/my_app_bar.dart';
import 'package:bmi/screens/screen_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeightAndWeight extends StatefulWidget {
  const HeightAndWeight({super.key, required this.isFemale});
  final bool isFemale;

  @override
  State<HeightAndWeight> createState() => _HeightAndWeightState();
}

class _HeightAndWeightState extends State<HeightAndWeight> {
  double weight = 0.0;
  double height = 0.0;
  Color colorr = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    widget.isFemale ? colorr = Colors.pink : colorr = Colors.blue;
    return Scaffold(
      appBar: myOwnAppBar("Height & Weight"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Weight
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 300,
                          child: Slider(
                            min: 0.0,
                            max: 100.0,
                            inactiveColor: Colors.grey,
                            activeColor: colorr,
                            value: weight,
                            onChanged: (value) {
                              weight = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          color: colorr.withOpacity(0.3),
                          child: Row(
                            children: [
                               Icon(
                                Icons.fitness_center,
                                color: colorr,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Weight :${weight.round()}",
                                style:  TextStyle(
                                  color:colorr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(widget.isFemale == true
                      ? "assets/images/female.svg"
                      : "assets/images/male.svg"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //height
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 300,
                          child: Slider(
                            min: 0.0,
                            max: 190.0,
                            inactiveColor: Colors.grey,
                            activeColor: colorr,
                            value: height,
                            onChanged: (value) {
                              height = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          color: widget.isFemale
                              ? colorr.withOpacity(0.3)
                              : colorr.withOpacity(0.3),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fitness_center,
                                color: colorr,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "height : ${height.round()}",
                                style: TextStyle(
                                  color: colorr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                final result = weight / pow((height / 100), 2);
                print("Your BMI is $result");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenResult(
                      bmiResult: result,
                      isFemale: widget.isFemale,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: widget.isFemale ? colorr : colorr,
                ),
                child: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
