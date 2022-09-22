import 'package:flowshipper/main.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

import 'ChangeThemeButton.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool value = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
      child: Drawer(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/green_paper.jpg"),
                fit: BoxFit.cover),
          ),
          child:  ListView(
            padding: EdgeInsets.only(left: 20,),
            children: [
              Directionality(
                textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
                child: DrawerHeader(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DottedBorder(
                            borderType: BorderType.Circle,
                            padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                            color: Colors.white,
                            dashPattern: [10,5,10,5,10,5],
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("images/person.jpg"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text (ChooseLang.lang?'أهلا وسهلاً': 'Welcom',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12
                              ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20,),
                            child: Text('Sabrina Lorenshtein',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                              ),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20,),
                            child: Text(ChooseLang.lang? '+١(٩٧١)٤٧٠-٩٢٨١':'+1 (917) 470-9281',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12
                              ),),
                          ),
                        ],

                      ),
                      TextButton(onPressed:(){
                        Navigator.pop(context);
                      },
                        child:Padding(
                            padding: EdgeInsets.only(bottom: 100),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            )
                        ),),
                    ],
                  ),

                ),
              ),
              Align(
                alignment:ChooseLang.lang?  Alignment.topRight: Alignment.topLeft ,
                  child: ChangeThemeButtonWidget()),
              // Column(
              //   children: [
              //     Row(
              //         children:[
              //           Align(
              //             alignment: Alignment.topRight,
              //             child: IconButton(icon:
              //             Icon(Icons.close),
              //               color: Colors.white,
              //               iconSize: 30.0,
              //               onPressed: () {
              //                 // Navigator.push(
              //                 //   context,
              //                 //   MaterialPageRoute(builder: (context) => HomeRoute()),
              //                 // );
              //               },
              //             ),
              //           ),
              //         ]
              //
              //     ),
              //   ],
              // ),

              // ListTile(
              //
              //   leading: Icon(FontAwesomeIcons.moon, size: 20,),
              //   iconColor: Colors.white,
              //   title: Text('Theme',
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),),
              //   onTap: () {
              //
              //     setState((){
              //       MyApp.of(context)?.myThemeMode= ThemeMode.light;
              //     });
              //     Navigator.pop(context);
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => ),
              //     // );
              //   },
              // ),
              ListTile(
                leading: Icon(FontAwesomeIcons.globe, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang? 'اكتشف':'Discover',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ),
                  // );
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.user, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang?'الصفحة الشخصية':'Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.codeBranch, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang? 'الرمز ترويجي' : 'Promocodes',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.list, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang? 'تاريخ الطلب': 'Order History',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.creditCard, size:20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang? 'طريقة الدفع':'Payment Methods',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SettingRoute()),
                  // );
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.gift, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang? 'برنامج الشركاء':'Partners Program',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.gear, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang?'الاعدادات':'Settings',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.phoneFlip, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang?'الدعم':'Support',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => SecondRoute()),
                  //   );
                },
              ),

              ListTile(
                leading: Icon(FontAwesomeIcons.language, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang? 'اللغة':'Language',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Languages()));
                  // showAlertDialog(context);
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.rightFromBracket, size: 20,),
                iconColor: Colors.white,
                title: Text(ChooseLang.lang?'تسجيل الخروج':'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onTap: () {
                  // showAlertDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}