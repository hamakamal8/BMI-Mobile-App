import 'package:bmi/components/my_app_bar.dart';
import 'package:bmi/screens/screen_height_weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenGender extends StatefulWidget {
  const ScreenGender({super.key});

  @override
  State<ScreenGender> createState() => _ScreenGenderState();
}

class _ScreenGenderState extends State<ScreenGender> {
  bool _onselected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myOwnAppBar("Choose Gender"),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _onselected = true;
                    });
                  },
                  child: Opacity(
                    opacity: _onselected == true ? 1.0 : 0.3,
                    child: Container(
                      width: 175,
                      height: 350,
                      child: SvgPicture.asset("assets/images/female.svg"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _onselected = false;
                    });
                  },
                  child: Opacity(
                    opacity: _onselected == false ? 1.0 : 0.3,
                    child: Container(
                      width: 175,
                      height: 350,
                      child: SvgPicture.asset("assets/images/male.svg"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HeightAndWeight(isFemale: _onselected,)));
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: _onselected == true ? Colors.pink : Colors.blue,
                ),
                child: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
