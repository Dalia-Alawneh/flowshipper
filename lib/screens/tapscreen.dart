
import 'package:flowshipper/main.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flowshipper/screens/register.dart';
import 'package:flowshipper/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:flowshipper/screens/drawer.dart';
import 'theme.dart';
import 'login.dart';

class TapScreen extends StatefulWidget {
  // TapScreen({required this.image});
  // final image;
  // static bool tapped = true;

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  bool tapped = true;
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
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            drawer: DrawerScreen(),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          ThemeProvider().isDarkMode?
                          'images/darkmodebg1.png' :  tapped ?
                          'images/bgdark.jpeg': 'images/bgcolor.jpeg'
                         ))
              ),
              child: ListView(
                children:[
                  // CircleAvatar(
                  //     backgroundImage: AssetImage(image)
                  // ),
                  Column(
                    children: [
                      Image(
                        height: 70,
                        width: 70,
                        image: AssetImage('images/FSlogo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 55),
                        child: Text(ChooseLang.lang? 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص.' : 'Lorem ipsum, dolor sit'
                            ' amet consectert elit.'
                            ' maiors incidunt mais esse',
                          textAlign: TextAlign.center,
                          style: TextStyle(


                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:15, left: 20, right: 20),
                        child: TabBar(
                          onTap: (val){
                            setState((){
                              tapped = !tapped;
                        });
                          },


                          labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold

                          ),
                          tabs:[
                            Tab(
                              text: ChooseLang.lang? 'تسجيل الدخول':'LOGIN',
                            ),
                            Tab(

                              text: ChooseLang.lang? 'انشاء حساب' : 'SIGN UP',
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        child: TabBarView(
                            children: [
                              Login(),
                              Register()
                            ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Copyright',
                            style:TextStyle(
                              color:MyApp.of(context)?.myThemeMode== ThemeMode.light?
                              Colors.black38:Color(0xffd5d5d5),

                            )),
                      Icon(Icons.copyright_sharp,size: 16, color: MyApp.of(context)?.myThemeMode== ThemeMode.light?
                      Colors.black38:Color(0xffd5d5d5),),
                      Text('web Technology Ltd',
                      style: TextStyle(
                        color: MyApp.of(context)?.myThemeMode== ThemeMode.light?
                        Colors.black38:Color(0xffd5d5d5),
                      ),
                      )
                    ],
                  )

                ],

              ),
            ) ,
          )),
    );
  }
}
