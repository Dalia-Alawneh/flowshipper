import 'package:flowshipper/screens/register.dart';
import 'package:flowshipper/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen>{

  final GlobalKey<SlideActionState> _key = GlobalKey();
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(

        title: "Choose Your Location",
        styleTitle: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle: TextAlign.left,

        description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit quis lacus commodo malesuada. Integer interdum sem ut dui ultricies, in vehicula ex rhoncus. Fusce interdum eros at erat vestibulum, non imperdiet odio tempus. Quisque porta mauris nunc, sed laoreet sem facilisis a. Proin sodales arcu vulputate consectetur tincidunt. Vestibulum eu viverra ante. Maecenas sed facilisis eros.",
          textAlignDescription: TextAlign.left,
          styleDescription: const TextStyle(
            wordSpacing: 2,
            height: 1.5,
            color: Colors.black54,
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway',),

        pathImage: "images/1.jpeg",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(

        title: "Deliver To Your Door",
        styleTitle: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle: TextAlign.left,

        description:
        "Consectetur adipiscing elit. Phasellus blandit quis lacus commodo malesuada. Integer interdum sem ut dui ultricies, in vehicula ex rhoncus.",
        textAlignDescription: TextAlign.left,
        styleDescription: const TextStyle(
          wordSpacing: 2,
          height: 1.5,
          color: Colors.black54,
          fontSize: 18.0,
          fontStyle: FontStyle.normal,
          fontFamily: 'Raleway',),

        pathImage: "images/2.jpeg",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(

        title: "Pay Securely After Delivery",
        styleTitle: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle: TextAlign.left,

        description:
        "Fusce interdum eros at erat vestibulum, non imperdiet odio tempus. Quisque porta mauris nunc, sed laoreet sem facilisis a. Proin sodales arcu vulputate consectetur tincidunt. Vestibulum eu viverra ante. Maecenas sed facilisis eros.",
        textAlignDescription: TextAlign.left,
        styleDescription: const TextStyle(
          wordSpacing: 2,
          height: 1.5,
          color: Colors.black54,
          fontSize: 18.0,
          fontStyle: FontStyle.normal,
          fontFamily: 'Raleway',),

        pathImage: "images/3.jpeg",
        backgroundColor: Colors.white,
      ),
    );
    // WidgetsBinding.instance.addObserver(this);
  }

  // @override
  //    void dispose() {
  //     WidgetsBinding.instance.removeObserver(this);
  //      super.dispose();
  //   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child:Column(
            children: [
            Expanded(
              child: IntroSlider(
              slides: this.slides,
              showNextBtn: false,
              showPrevBtn: false,
              showSkipBtn: false,
              showDoneBtn: false,
          ),
            ),
            Padding(
          padding: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: SlideAction(
            text: "Create Account",
            key: _key,
            onSubmit: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Register();
              }));
              Future.delayed(
                Duration(seconds: 1),
                    () => _key.currentState?.reset(),
              );
            },
            innerColor: Colors.white,
            outerColor: Colors.black,
          ),
        ),
            ],
          ),
      ),
    );
  }
}