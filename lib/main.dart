import 'package:flowshipper/screens/code_screen.dart';
import 'package:flowshipper/screens/login.dart';
import 'package:flowshipper/screens/register.dart';
import 'package:flowshipper/screens/sign_in.dart';
import 'package:flowshipper/screens/tapscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/welcome.dart';
import 'screens/languages.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void changeTheme(ThemeMode themeMode) {
      setState(() {
        _themeMode = themeMode;
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        themeMode: _themeMode,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color:Colors.black54,fontSize: 20, fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.black87)
        ),
              brightness: Brightness.light,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black54))
        ),
      home: TapScreen(),

    );
  }
}
