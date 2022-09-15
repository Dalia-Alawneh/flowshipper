import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bgcolor.jpeg"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image.asset(
                  'images/FSlogo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text("Various versions have evolved over the years, sometimes by accident",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                ),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(25),
                  padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                  color: Colors.grey,
                  dashPattern: [10,5,10,5,10,5],
                  child: TextFormField(
                    enabled: false,
                    style: TextStyle(
                        fontFamily: 'Montserrat-Bold'
                    ),
                    decoration: InputDecoration(
                      focusColor: Color(0xffD8B261),
                      hintStyle: TextStyle(color: Colors.grey),
                      errorStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Montserrat-Bold'
                      ),
                      border: InputBorder.none,
                      hintText: 'Haneen@gmail.com',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: TextButton(
                  style:
                  ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                    padding: MaterialStateProperty.all(EdgeInsets.only(top: 15 , bottom: 15)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.black),
                      ),),),
                  onPressed: () async{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Languages()));
                  },
                  child: Text('SIGN IN',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),),
              ),
            ],
          )
        ),

      ),
    );
  }
}
