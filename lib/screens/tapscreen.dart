
import 'package:flowshipper/screens/languages.dart';
import 'package:flowshipper/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flowshipper/screens/drawer.dart';

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
                      image: AssetImage(tapped ? 'images/bgdark.jpeg': 'images/bgcolor.jpeg'))
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
                              color: Colors.black38,
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
                          labelColor: Colors.black87,
                          indicatorColor: Color(0xff2b2b2b),
                          unselectedLabelColor: Colors.black38,
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
                              color: Colors.black38,

                            )),
                      Icon(Icons.copyright_sharp,size: 16, color: Colors.black38,),
                      Text('web Technology Ltd',
                      style: TextStyle(
                        color: Colors.black38,
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
