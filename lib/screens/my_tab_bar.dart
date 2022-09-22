import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.symmetric(vertical: 10),
      tabs: [

        Icon(Icons.storefront_sharp),
        Icon(Icons.newspaper),
        Icon(Icons.person_pin),
        Icon(Icons.settings_outlined),
        Icon(Icons.shopping_cart ),

    ],

    );
  }
}
class tabbarItem extends StatelessWidget {
  const tabbarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Icon(Icons.storefront_sharp);
  }
}