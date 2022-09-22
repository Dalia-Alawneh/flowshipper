import 'package:flutter/material.dart';
import 'address.dart';
import 'changepassword.dart';
import 'drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'languages.dart';
import 'package:flowshipper/screens/personalinfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          child: Text('Profile', style: TextStyle(
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
                      'images/personalinfo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text('Profile Information', style: TextStyle(
                    fontSize: 18, color: Colors.black87,
                    letterSpacing: 0.9,
                  ),textAlign: TextAlign.center,),
                  Padding(
                    padding: EdgeInsets.only(left: 65,right: 65, top: 10, bottom: 40),
                    child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: TextStyle(
                      fontSize: 13, color: Colors.black54,
                      letterSpacing: 0.9,
                    ),textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Color(0xC8E7E6E6),
                      dashPattern: [10,5,10,5,10,5],
                      child: Card(
                          child: ListTile(
                            leading: Icon(FontAwesomeIcons.map, size: 20,),
                            iconColor: Colors.black87,
                            title: Text(ChooseLang.lang?'أضف عنوانك':'Add Address',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16
                              ),),
                            trailing: Wrap(
                              spacing: 12,
                              children:<Widget> [
                                Icon(Icons.arrow_forward, color: Colors.black87,),
                              ],
                            ),
                              tileColor: Color(0x6FE7E6E6),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressSetting()));
                            },
                          ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Color(0xC8E7E6E6),
                      dashPattern: [10,5,10,5,10,5],
                      child: Card(
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.user, size: 20,),
                          iconColor: Colors.black87,
                          title: Text(ChooseLang.lang?'معلوماتك الشخصية':'Personal Information',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16
                            ),),
                          trailing: Wrap(
                            spacing: 12,
                            children:<Widget> [
                              Icon(Icons.arrow_forward, color: Colors.black87,),
                            ],
                          ),
                          tileColor: Color(0x6FE7E6E6),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfo()));
                          },
                        ),
                      ),

                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Color(0xC8E7E6E6),
                      dashPattern: [10,5,10,5,10,5],
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.lock_outline_rounded, size: 25,),
                          iconColor: Colors.black87,
                          title: Text(ChooseLang.lang?'تغيير كلمة المرور':'Change Password',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16
                            ),),
                          trailing: Wrap(
                            spacing: 12,
                            children:<Widget> [
                              Icon(Icons.arrow_forward, color: Colors.black87,),
                            ],
                          ),
                          tileColor: Color(0x6FE7E6E6),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                          },
                        ),
                      ),
                    ),
                  ),

                ],
        ),

      ),
    );
  }
}
