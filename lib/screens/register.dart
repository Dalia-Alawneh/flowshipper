import 'dart:ffi';

import 'package:flowshipper/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'tapscreen.dart';
import 'languages.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = TextEditingController();
  final fierStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String email, pass;
  late String firstName, lastName;
  late String phone;
  bool _isObscure=true;
  bool _confirmObscure=true;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return
    //Column(
       //   children: [
       //     Padding(
       //       padding: EdgeInsets.fromLTRB(20, 20,20,0),
       //       child: TextFormField(
       //         style: TextStyle(
       //             fontFamily: 'Montserrat-Bold'
       //         ),
       //         decoration: InputDecoration(
       //           errorStyle: TextStyle(
       //               fontSize: 14.0,
       //               fontFamily: 'Montserrat-Bold'
       //           ),
       //           border: OutlineInputBorder(),
       //           hintText: 'Enter your email',
       //         ),
       //         validator: (value){
       //
       //           if(value!.isEmpty){
       //             return "email is required";
       //           }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
       //             return "Please Enter a correct email";
       //           }else
       //             print(email);
       //           return null;
       //         },
       //        onChanged: (value){
       //           if()
       //          email = value;
       //        }
       //
       //       ),
       //     ),
       //     Padding(
       //       padding: EdgeInsets.fromLTRB(20, 20,20,0),
       //       child: TextFormField(
       //         style: TextStyle(
       //             fontFamily: 'Montserrat-Bold'
       //         ),
       //         obscureText: _isObscure,
       //         validator: (value){
       //           pass = value!;
       //           if(value.isEmpty){
       //             return "Password is required";
       //           }else
       //             return null;
       //         },
       //         decoration: InputDecoration(
       //             errorStyle: TextStyle(
       //                 fontSize: 14.0,
       //                 fontFamily: 'Montserrat-Bold'
       //             ),
       //             hintText: 'Enter your Password',
       //             border: OutlineInputBorder(),
       //             suffixIcon: IconButton(
       //                 icon:
       //                 Icon(
       //                   _isObscure ? Icons.visibility : Icons.visibility_off,
       //                   color: Color(0xff55ddee),
       //                 ),
       //                 onPressed: () {
       //                   setState(() {
       //                     _isObscure = !_isObscure;
       //                   });
       //                 })),
       //       ),
       //     ),
       //             Container(
       //               width: double.infinity,
       //               margin: EdgeInsets.fromLTRB(20,0,20,0),
       //               decoration: BoxDecoration(
       //                   color: Color(0xff55ddee),
       //                   borderRadius: BorderRadius.circular(30)
       //               ),
       //               child: TextButton(
       //                 style: TextButton.styleFrom(
       //                 ),
       //                 onPressed:() {
       //                   print(pass);
       //                   print(email);
       //                 },
       //
       //                 child: Text('Create Account',
       //                   style: TextStyle(
       //                     color: Color(0xffffffff),
       //                     fontSize: 20,
       //                     fontFamily: 'Montserrat',
       //                     fontWeight: FontWeight.bold,
       //                   ),
       //                 ),),
       //             ),
       //   ],
       // )
      Directionality(
        textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(

                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(25),
                                  padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                                  color: Colors.grey,
                                  dashPattern: [10,5,10,5,10,5],
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat-Bold'
                                    ),
                                    decoration: InputDecoration(
                                      focusColor: Color(0xffD8B261),
                                      hintStyle: TextStyle(color: Colors.black38),
                                      errorStyle: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Montserrat-Bold'
                                      ),
                                      border: InputBorder.none,
                                      hintText: ChooseLang.lang? 'الاسم الأول' : 'First name',
                                  ),
                                  // validator: (value){
                                  //   if(value!.isEmpty){
                                  //     return "First name is required";
                                  //   }else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                  //     return "Please Enter a correct name";
                                  //   }else
                                  //     return null;
                                  // },
                                  onChanged: (value){
                                    firstName = value;
                                  },
                                ),
                              ),
                            ),),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(25),
                                  padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                                  color: Colors.grey,
                                  dashPattern: [10,5,10,5,10,5],
                                  child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat-Bold'
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: Color(0xffD8B261),
                                        hintStyle: TextStyle(color: Colors.black38),
                                        errorStyle: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Montserrat-Bold'
                                        ),
                                        border: InputBorder.none,
                                        hintText: ChooseLang.lang? 'الاسم الأخير' : 'Last name',
                                    ),
                                    // validator: (value){
                                    //   if(value!.isEmpty){
                                    //     return "Last name is required";
                                    //   }else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                    //     return "Please Enter a correct name";
                                    //   }else
                                    //     return null;
                                    // },
                                    onChanged: (value){
                                      lastName = value;
                                    }
                                ),
                              ),
                            ),)
                          ],
                        ),

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
                                  focusColor: Colors.black38,
                                  prefixIcon: Icon(Icons.phone, size:20,color: Colors.black38,),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  border: InputBorder.none,
                                  hintText:ChooseLang.lang? 'رقم الهاتف':'Phone number',
                              ),
                              // validator: (value){//   if(value!.isEmpty){
                              //     return "Phone number is required";
                              //   }else if(!RegExp(r'^[0-9]+$').hasMatch(value)){
                              //     return "Please Enter a correct number";
                              //   }else
                              //     return null;
                              // },
                              onChanged: (value){
                                phone = value;
                              }
                          ),
                        ),),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(25),
                            padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                            color: Colors.grey,
                            dashPattern: [10,5,10,5,10,5],
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Bold'
                              ),
                              decoration: InputDecoration(
                                focusColor: Color(0xffD8B261),
                                hintStyle: TextStyle(color: Colors.black38),
                                errorStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat-Bold'
                                ),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email_outlined,size:20,color: Colors.black38,),
                                hintText: ChooseLang.lang? 'البريد الالكتروني':'Email',
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
                                  focusColor: Colors.black38,
                                  hintStyle: TextStyle(color: Colors.black38),
                                  errorStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat-Bold'
                                  ),
                                  border: InputBorder.none,
                                  hintText: ChooseLang.lang?'كلمة المرور' :'Password',
                                  prefixIcon: Icon(Icons.lock_outline,size:20,color: Colors.black38,),
                                  suffixIcon: IconButton(
                                      icon:
                                      Icon(
                                        _isObscure ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.black38,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      })
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

                            ),
                          ),
                        ),
                        Padding(

                            // validator: (value){
                            //
                            //   if(value!.isEmpty){
                            //     return "Password confirmation is required";
                            //   }else if(pass == value)
                            //     return "Password dose not equal confirm password";
                            // },
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(25),
                              padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                              color: Colors.grey,
                              dashPattern: [10,5,10,5,10,5],
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Bold'
                                ),
                                decoration: InputDecoration(
                                    focusColor: Colors.black38,
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: InputBorder.none,
                                    hintText: ChooseLang.lang? 'تأكيد كلمة المرور' : 'Confirm Password',

                                suffixIcon: IconButton(
                                    icon:
                                    Icon(
                                      _confirmObscure ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.black38,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _confirmObscure = !_confirmObscure;
                                      });
                                    })),
                          ),
                        ),)
                      ],
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal:20, vertical: 30),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10)
                      ),
                      onPressed: () async{
                        try{
                          final user = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
                          if(_formKey.currentState!.validate() && user != null){
                            fierStore.collection('users').add({
                              'firstName': firstName,
                              'lastName': lastName,
                              'email' : email,
                              'phone' :phone,
                              'password' : pass
                            });
                            print(phone);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                          }
                          // if(_formKey.currentState!.validate()){
                          //
                          //     }
                        }catch(e){
                          print(e);
                        }
                      },
                      child: Text(ChooseLang.lang? 'إنشاء حساب':'SIGN UP',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1
                        ),
                      ),),
                  ),
                  Directionality(
                    textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ChooseLang.lang? 'لديك حساب بالفعل؟': 'Already have account? ',
                            style:TextStyle(
                          color: Colors.black38
                        )),
                        TextButton(
                          onPressed: () {

                          },
                          child: Container(
                            decoration: BoxDecoration(

                            ),
                            child: Text(ChooseLang.lang? 'تسجيل الدخول':'Login',
                            style:  TextStyle(

                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
    ),
      );
  }
}

