import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dotted_border/dotted_border.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  late String email, pass;
  bool _isObscure=true;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading:BackButtonIcon(),
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Sign in to access to our services',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                        radius: Radius.circular(25),
                        padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                      color: Colors.grey,
                      dashPattern: [10,5,10,5,10,5],
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold'
                        ),
                        decoration: InputDecoration(
                          focusColor: Color(0xffD8B261),
                          hintStyle: TextStyle(color: Colors.black87),
                          errorStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Montserrat-Bold'
                          ),
                          border: InputBorder.none,
                          hintText: 'Enter your Email',
                        ),
                        onChanged: (value){
                          email = value;
                        },
                        validator: (value){
                          // email = value!;
                          if(value!.isEmpty){
                            return "email is required";
                          }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                            return "Please Enter a correct email";
                          }else
                            return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold'
                      ),
                      onChanged: (value){
                        pass = value;
                      },
                      validator: (value){
                        // pass = value!;
                        if(value!.isEmpty){
                          return "Password is required!";
                        }else
                          return null;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          focusColor: Color(0xffD8B261),
                          hintStyle: TextStyle(color: Color(0xffD8B261)),
                          errorStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Montserrat-Bold'
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          hintText: 'Enter your Password',
                          suffixIcon: IconButton(
                              icon:
                              Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off,
                                color: Color(0xffD8B261),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              })),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child:
                      Row(
                        children: [
                          CheckBox(),
                          Text('Remember Me!',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 16,
                            ),),
                        ],
                      ),
                      ),

                      TextButton(
                        onPressed: (){
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPassword()));

                        },
                        child: Text('Forget password?',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat-bold',
                            fontSize: 16,
                            color: Color(0xffD8B261),
                          ),),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffD8B261),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 100)
                      ),
                      onPressed: () async{
                        try{
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: pass);
                          if(user != null){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Languages()));
                          }
                          // if(_formKey.currentState!.validate()){
                          //
                          //     }
                          }catch(e){
                          print(e);
                        }
                          },
                      child: Text('Login',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1
                        ),
                      ),),
                  ),
                ],
              )),
        ],

      ),
    );
  }
}
class CheckBox extends StatefulWidget {
  const CheckBox({key}) : super(key: key);

  @override
  State<CheckBox> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xffD8B261);
      }
      return Color(0xffD8B261);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
