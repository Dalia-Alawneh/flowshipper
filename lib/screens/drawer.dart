import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            DrawerHeader(
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
                        child: Text('Welcom',
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
                              fontSize: 17
                          ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,),
                        child: Text('+1 (917) 470-9281',
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

            ListTile(
              leading: Icon(FontAwesomeIcons.moon, size: 20,),
              iconColor: Colors.white,
              title: Text('Theme',
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
              leading: Icon(FontAwesomeIcons.globe, size: 20,),
              iconColor: Colors.white,
              title: Text('Discover',
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
              title: Text('Profile',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.codeBranch, size: 20,),
              iconColor: Colors.white,
              title: Text('Promocodes',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.list, size: 20,),
              iconColor: Colors.white,
              title: Text('Order History',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.creditCard, size:20,),
              iconColor: Colors.white,
              title: Text('Payment Methods',
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
              title: Text('Partners Program',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.gear, size: 20,),
              iconColor: Colors.white,
              title: Text('Settings',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.phoneFlip, size: 20,),
              iconColor: Colors.white,
              title: Text('Support',
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
              title: Text('Language',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onTap: () {
                // showAlertDialog(context);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.rightFromBracket, size: 20,),
              iconColor: Colors.white,
              title: Text('Log Out',
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
    );
  }
}