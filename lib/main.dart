import 'package:flutter/material.dart';

import 'screens/welcome.dart';
import 'screens/languages.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black87)
        )),
      home: Welcome(),
    );
  }
}
