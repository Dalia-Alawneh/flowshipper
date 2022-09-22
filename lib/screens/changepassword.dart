import 'package:flowshipper/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'drawer.dart';
import 'languages.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  late String pass;
  bool _isObscure=true;
  bool _confirmObscure=true;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),
    ),
    title: Align(
    widthFactor: 6,
    alignment: Alignment.center,
    child: Text('Change Password', style: TextStyle(
    color: Colors.black54,
    fontSize: 15,
    ),
    ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    ),
    // drawer: DrawerScreen(),
    endDrawer: DrawerScreen(),
    body: SafeArea(
    child: ListView(
    children: [
    Padding(
    padding: EdgeInsets.only(top:60, bottom: 10),
    child: Image.asset(
    'images/changepassword.png',
    width: 100,
    height: 100,
    ),
    ),
      Text('Change Password', style: TextStyle(
        fontSize: 18, color: Colors.black87,
        letterSpacing: 0.9,
      ),textAlign: TextAlign.center,),
      Padding(
        padding: EdgeInsets.only(left: 65,right: 65, top: 10, bottom: 40),
        child: Text('Enter your new password and then click on the \'Save\' button below.' , style: TextStyle(
          fontSize: 13, color: Colors.black54,
          letterSpacing: 0.9,
        ),textAlign: TextAlign.center,),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(25),
          padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
          color: Colors.grey,
          dashPattern: [10,5,10,5,10,5],
          child: TextFormField(
            cursorColor: Colors.black54,
            decoration: InputDecoration(
                focusColor: Colors.black38,
                errorStyle: TextStyle(
                    fontSize: 14.0,
                ),
                border: InputBorder.none,
                hintText: ChooseLang.lang?'كلمة المرور' :'Password',
                prefixIcon: Icon(Icons.lock_outline,size:20,color: Colors.black54,),
                suffixIcon: IconButton(
                    icon:
                    IconTheme(
                      data: IconThemeData(
                        color: Colors.black54
                      ),
                      child: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
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
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(25),
          padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
          color: Colors.grey,
          dashPattern: [10,5,10,5,10,5],
          child: TextFormField(
            cursorColor: Colors.black54,
            obscureText: true,
            decoration: InputDecoration(
                focusColor: Colors.black38,
                border: InputBorder.none,
                hintText: ChooseLang.lang? 'تأكيد كلمة المرور' : 'Confirm Password',
                prefixIcon: Icon(Icons.lock_outline,size:20,color: Colors.black54,),
                suffixIcon: IconButton(
                    icon:
                    IconTheme(
                      data: IconThemeData(
                        color: Colors.black54
                      ),
                      child: Icon(
                        (
                            _confirmObscure ? Icons.visibility : Icons.visibility_off)
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmObscure = !_confirmObscure;
                      });
                    })),
          ),
        ),),
     Padding(
       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: ListTile(
            tileColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25),
                ),),
            leading: Padding(
                padding: EdgeInsets.only(left: 100),
                child: Icon(Icons.save, size: 20,)),
            iconColor: Colors.white,
            title: Text(ChooseLang.lang? 'حفظ':'SAVE',
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18,
                  letterSpacing: 1.1)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
          )),
     // ),
    ]
    ),
    ),
    );
  }
}
