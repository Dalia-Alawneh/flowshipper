import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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
                  Text('FlowShipper', style: TextStyle(
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
                    child: Text('Welcome', style: TextStyle(
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
