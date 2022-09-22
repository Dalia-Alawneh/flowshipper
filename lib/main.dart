import 'package:flowshipper/screens/address.dart';
import 'package:flowshipper/screens/changepassword.dart';
import 'package:flowshipper/screens/code_screen.dart';
import 'package:flowshipper/screens/intro.dart';
import 'package:flowshipper/screens/languages.dart';
import 'package:flowshipper/screens/login.dart';
import 'package:flowshipper/screens/profile.dart';
import 'package:flowshipper/screens/register.dart';
import 'package:flowshipper/screens/drawer.dart';
import 'package:flowshipper/screens/sign_in.dart';
import 'package:flowshipper/screens/tapscreen.dart';
import 'package:flowshipper/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/theme.dart';
import 'screens/welcome.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode myThemeMode = ThemeMode.light;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: ProfileScreen(),
      );
    },
  );
}