import 'package:flowshipper/screens/tapscreen.dart';
import 'package:flowshipper/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'languages.dart';
class ReusableBottomBar extends StatelessWidget {
  const ReusableBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (val){
        switch(val){
          case 1: {Navigator.push(context, MaterialPageRoute(builder: (context)=>Languages()));break;}//History
          case 2: {Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));break;}//Account
          case 3: {Navigator.push(context, MaterialPageRoute(builder: (context)=>TapScreen()));break;}//Partners
          case 4: {Navigator.push(context, MaterialPageRoute(builder: (context)=>Languages()));break;}//cart page
          default: {Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));break;}

        }
      },
      unselectedFontSize: 11,
      selectedFontSize: 11,
      items: const[
        BottomNavigationBarItem(
          icon:Icon(Icons.storefront_sharp, ),
          label: 'Discovery',

        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.newspaper),
            label: 'History'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label:'Partners',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label:'Partners',
        ),
        // BottomNavigationBarItem(icon:
        // Icon(Icons.settings_outlined),
        //   label:'Partners'
        // ),
        // BottomNavigationBarItem(icon:
        // Icon(Icons.shopping_cart ),
        //   label:'Cart'
        // ),


      ],

    );
  }
}

