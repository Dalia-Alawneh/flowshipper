import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ChooseLang.lang? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButtonIcon(),
          title: Text(ChooseLang.lang? 'اختر لغة':'Choose Language'),
        ),
        body:  Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            children: [
              ChooseLang(
                imagePath: 'images/america.png',
                text:ChooseLang.lang? 'الانجليزية / الولايات المتحدة ': 'English/United States',
                ontap: (){
                  ChooseLang.lang =false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                },
              ),
              ChooseLang(
                imagePath: 'images/Georgia.png',
                text:ChooseLang.lang? 'الانجليزية / جيورجية': 'English/Georgian',
                ontap: (){
                  ChooseLang.lang =false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                },
              ),
              ChooseLang(
                imagePath: 'images/turky.png',
                text:ChooseLang.lang?'التركية': 'Turkish',
                ontap: (){
                  ChooseLang.lang =false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                },
              ),
              ChooseLang(
                imagePath: 'images/russia.png',
                text:ChooseLang.lang?'انجليزية / روسية ': 'English/Russian',
                ontap: (){
                  ChooseLang.lang =false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                },
              ),
              ChooseLang(
                imagePath: 'images/ps.png',
                text: ChooseLang.lang? 'العربية':'Arabic',
                ontap: (){
                  ChooseLang.lang =true;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class ChooseLang extends StatelessWidget {
  ChooseLang({required this.imagePath, required this.text, required this.ontap});
  final String imagePath;
  final String text;
  static bool lang = false;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap:ontap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                        backgroundImage: AssetImage(imagePath)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(text,
                    style: TextStyle(
                      color:Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_outlined,
                color: Colors.black87,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xffc8c8c8),
          )
        ],
      ),
    );
  }
}
