import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'languages.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Icon(FontAwesomeIcons.paperPlane,
                      color: Colors.white,
                      size: 50,
                      ),
                  Text(ChooseLang.lang?'شحن الزهور':'FlowShipper', style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                    // textAlign: TextAlign.center,
                    ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 200.0,
                  height: 60.0,
                  child: OutlinedButton(onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Languages( );
                  }));},
                    style: OutlinedButton.styleFrom(
                      shape:StadiumBorder(),
                      side: BorderSide(width: 1, color: Colors.white),),
                    child: Text(ChooseLang.lang?'اهلا وسهلا':'Welcome', style: TextStyle(
                    color: Colors.white,
                  ),),),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
