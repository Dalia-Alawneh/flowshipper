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
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  final _auth = FirebaseAuth.instance;
  late String email, pass;
  bool _isObscure=true;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ChooseLang.lang? TextDirection.rtl : TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                          return  ChooseLang.lang? 'الايميل مطلوب!' : "email is required";
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
                      hintText:ChooseLang.lang? 'كلمة المرور' : 'Password',
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
                Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Color(0xff3b3b3b),
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
                    child: Text(   ChooseLang.lang? 'تسجيل الدخول' : 'SIGN IN',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1
                      ),
                    ),),
                ),
                TextButton(
                  onPressed: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPassword()));

                  },
                  child: Text(ChooseLang.lang? 'نسيت كلمة المرور؟':'Forget password?',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-bold',
                      fontSize: 16,
                      color: Colors.black54,
                    ),),
                )
              ],
            )),
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
