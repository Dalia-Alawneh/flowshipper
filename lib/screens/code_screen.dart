import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:email_auth/email_auth.dart';

import 'drawer.dart';
import 'flowersapi.dart';


class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key,}) : super(key: key);
  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {

  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  void getFlowerData() async{
    try {
      var data = await Flowers().getData();
      //13. We can't await in a setState(). So you have to separate it out into two steps.
      print(data);

    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFlowerData();
  }
  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: DrawerScreen(),
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
                    padding: EdgeInsets.only(left: 40, right: 40,),
                    color: Colors.grey,
                    dashPattern: [10,5,10,5,10,5],
                    child:PinCodeTextField(
                      length: 4,
                      controller: newTextEditingController,
                      focusNode: focusNode,
                      onCompleted: (result) {
                        print(result);
                      }, appContext: context, onChanged: (String value) {  },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextButton(
                    style:
                    ButtonStyle(
                      elevation: MaterialStateProperty.all(3),
                      padding: MaterialStateProperty.all(EdgeInsets.only(top: 15 , bottom: 15)),
                      backgroundColor: MaterialStateProperty.all(Color(
                          0x9EC7C7C5)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Color(0x9EC7C7C5)),
                        ),),),
                    onPressed: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Languages()));
                    },
                    child: Text('LOGIN',
                      style: TextStyle(
                        color: Colors.white38,
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
