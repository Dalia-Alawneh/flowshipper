import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "CHOOSE YOUR LOCATION",
        styleTitle: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle: TextAlign.right,
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "images/1.jpeg",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "CHOOSE YOUR LOCATION",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/2.jpeg",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/3.jpeg",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      showNextBtn: false,
      showPrevBtn: false,
      showSkipBtn: false,
      showDoneBtn: false,
    );
  }
}