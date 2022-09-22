import 'package:flowshipper/main.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flowshipper/screens/tapscreen.dart';
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
    setState(() {

    });

    slides.add(
      new Slide(
        title: ChooseLang.lang? 'اختر موقعك' : "Choose Your Location",
        styleTitle: TextStyle(
          color: MyApp.of(context)!.myThemeMode==ThemeMode.light?
          Colors.black87: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle:ChooseLang.lang?TextAlign.right : TextAlign.left,

        description: ChooseLang.lang? 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء.'
        : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit quis lacus commodo malesuada. Integer interdum sem ut dui ultricies, in vehicula ex rhoncus. Fusce interdum eros at erat vestibulum, non imperdiet odio tempus. Quisque porta mauris nunc, sed laoreet sem facilisis a. Proin sodales arcu vulputate consectetur tincidunt. Vestibulum eu viverra ante. Maecenas sed facilisis eros.",
          textAlignDescription: ChooseLang.lang? TextAlign.right : TextAlign.left,
          styleDescription: const TextStyle(
            wordSpacing: 2,
            height: 1.5,
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway',),

        pathImage: "images/1.jpeg",

      ),
    );
    slides.add(
      new Slide(

        title: ChooseLang.lang? 'التوصيل الى باب بيتك' :"Deliver To Your Door",
        styleTitle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle:ChooseLang.lang?TextAlign.right : TextAlign.left,


        description: ChooseLang.lang? 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.'
        :
        "Consectetur adipiscing elit. Phasellus blandit quis lacus commodo malesuada. Integer interdum sem ut dui ultricies, in vehicula ex rhoncus.",
        textAlignDescription: ChooseLang.lang? TextAlign.right : TextAlign.left,
        styleDescription: const TextStyle(
          wordSpacing: 2,
          height: 1.5,
          fontSize: 18.0,
          fontStyle: FontStyle.normal,
          fontFamily: 'Raleway',),

        pathImage: "images/2.jpeg",

      ),
    );
    slides.add(
      new Slide(

        title: ChooseLang.lang? 'الدفع عند التوصيل' : "Pay Securely After Delivery",
        styleTitle: TextStyle(

          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlignTitle:ChooseLang.lang?TextAlign.right : TextAlign.left,


        description: ChooseLang.lang?'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما-.'
        :
        "Fusce interdum eros at erat vestibulum, non imperdiet odio tempus. Quisque porta mauris nunc, sed laoreet sem facilisis a. Proin sodales arcu vulputate consectetur tincidunt. Vestibulum eu viverra ante. Maecenas sed facilisis eros.",
        textAlignDescription: ChooseLang.lang? TextAlign.right : TextAlign.left,

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

    return Directionality(
      textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
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
            child: Directionality(
              textDirection: ChooseLang.lang? TextDirection.ltr: TextDirection.rtl,
              child: SlideAction(
                text:ChooseLang.lang?'انشاء حساب' : "Create Account",
                key: _key,
                onSubmit: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return TapScreen();
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
          ),
              ],
            ),
        ),
      ),
    );
  }
}