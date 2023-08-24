import 'package:bmi/components/my_app_bar.dart';
import 'package:bmi/screens/screen_gender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenResult extends StatelessWidget {
  ScreenResult({super.key, required this.bmiResult, required this.isFemale});
  final double bmiResult;
  final bool isFemale;
  Color colorr = Colors.transparent;
  late Color resultTextColor;

  String getBmiResultText() {
    String text;
    if (bmiResult < 18.5) {
      text = "You are underweight";
      resultTextColor = Colors.red;
    } else if (bmiResult >= 18.5 && bmiResult <= 24.9) {
      text = "You are healthy";
      resultTextColor = Colors.green;
    } else if (bmiResult >= 25 && bmiResult <= 29.9) {
      text = "You are fat";
      resultTextColor = Colors.red;
    } else if (bmiResult > 30) {
      text = "You are very fat";
      resultTextColor = Color.fromARGB(255, 187, 28, 16);
    } else {
      text = "Invaild";
      resultTextColor = Color.fromARGB(255, 47, 27, 26);
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    isFemale ? colorr = Colors.pink : colorr = Colors.blue;

    return Scaffold(
      appBar: myOwnAppBar("Result"),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Container(
                  height: 220,
                  width: 220,
                  color: colorr.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: 300,
                child: Image.asset("assets/images/Group 47.png"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                isFemale == true
                    ? "assets/images/female.svg"
                    : "assets/images/male.svg",
                width: 130,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                width: double.infinity,
                color: const Color(0xfffafafa),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3,
                              spreadRadius: 0.04),
                        ],
                      ),
                      child: Text(
                        getBmiResultText(),
                        style: TextStyle(color: resultTextColor),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Your bmi is ${bmiResult.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenGender()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: isFemale ? colorr : colorr,
                        ),
                        child: const Icon(
                          CupertinoIcons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
