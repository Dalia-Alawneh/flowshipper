import 'package:flowshipper/screens/home.dart';
import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:email_auth/email_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CodeScreen extends StatefulWidget {
  final String phone;
  CodeScreen({required this.phone});
  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  late String _verficationCode;
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
                    padding: EdgeInsets.only(left: 40, right: 40,),
                    color: Colors.grey,
                    dashPattern: [10,5,10,5,10,5],
                    child:PinCodeTextField(
                      length: 4,
                      controller: newTextEditingController,
                      focusNode: focusNode,

                      onCompleted: (result) async{
                        await FirebaseAuth.instance.signInWithCredential(
                            PhoneAuthProvider.credential(verificationId: _verficationCode, smsCode: result)).
                        then((value) async{
                          if(value.user !=null){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
                          }
                        });
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
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+97${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verficationCode = verficationID!;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verficationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
    ConfirmationResult confirmationResult = await FirebaseAuth.instance.signInWithPhoneNumber('+97${widget.phone}',
      // RecaptchaVerifier(
      //   container: 'recaptcha',
      //   onSuccess: () => print('reCAPTCHA Completed!'),
      //   onError: (FirebaseAuthException error) => print(error),
      //   onExpired: () => print('reCAPTCHA Expired!'), ,
       //)
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
