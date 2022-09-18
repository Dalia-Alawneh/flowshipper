
import 'package:flowshipper/screens/register.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
                      child: Text('Lorem ipsum, dolor sit'
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
                            text: 'LOGIN',
                          ),
                          Tab(

                            text: 'SIGN UP',
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
        ));
  }
}
