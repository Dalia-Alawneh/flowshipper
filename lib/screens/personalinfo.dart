import 'package:flowshipper/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'drawer.dart';
import 'languages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
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
          child: Text('Personal Information', style: TextStyle(
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
        Center(
          child: Padding(
          padding: EdgeInsets.only(top:60, bottom: 10),
          child: DottedBorder(
            borderType: BorderType.Circle,
            padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
            color: Colors.grey,
            dashPattern: [10,5,10,5,10,5],
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 55,
              backgroundImage: AssetImage("images/defultprofileimage.png",),
              child: Align(
                alignment: Alignment.bottomRight,
                  child: Container(
                    // margin: EdgeInsets.all(to),
                    padding: EdgeInsets.only(left: 42, top: 75),
                    width: 75,
                    child: FloatingActionButton(
                      onPressed: (){},
                        backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt_outlined, color: Colors.black54,)),
                  ),
                  ),
                ),
              ),
            ),
          ),

      Text('Name, Last name', style: TextStyle(
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
                padding: EdgeInsets.symmetric(horizontal: 45,),
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
                        hintText: ChooseLang.lang?' الاسم الأول' :'First Name',
                        prefixIcon: Icon(Icons.person_outline,size:20,color: Colors.black54,),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10),
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
                      hintText: ChooseLang.lang?' الاسم الأخير' :'Last Name',
                      prefixIcon: Icon(Icons.person_outline,size:20,color: Colors.black54,),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45,),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(25),
                  padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                  color: Colors.grey,
                  dashPattern: [10,5,10,5,10,5],
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      focusColor: Colors.black38,
                      errorStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      border: InputBorder.none,
                      hintText: ChooseLang.lang?' الاسم الأخير' :'Email address',
                      prefixIcon: Icon(Icons.email_outlined,size:20,color: Colors.black54,),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10),
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
                      hintText: ChooseLang.lang?'رقم الهوية' :'Personal ID',
                      prefixIcon: Icon(FontAwesomeIcons.idCard
                      ,size:16, color: Colors.black54,),
                    ),
                  ),
                ),
              ),
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
    ]
    ),
    ),
    );
  }
}
