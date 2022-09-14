import 'package:flowshipper/screens/intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButtonIcon(),
        title: Text('Choose Language'),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            ChooseLang(
              imagePath: 'images/america.png',
              text: 'English/United States',
            ),
            ChooseLang(
              imagePath: 'images/Georgia.png',
              text: 'English/Georgian',
            ),
            ChooseLang(
              imagePath: 'images/turky.png',
              text: 'Turkish',
            ),
            ChooseLang(
              imagePath: 'images/russia.png',
              text: 'English/Russian',
            ),
            ChooseLang(
              imagePath: 'images/ps.png',
              text: 'Arabic',
            ),
          ],
        ),
      ),
    );

  }
}

class ChooseLang extends StatelessWidget {
  ChooseLang({required this.imagePath, required this.text});
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
            },
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
