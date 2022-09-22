import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
class ThemeProvider extends ChangeNotifier{
  bool mode = true;
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {

      return themeMode == ThemeMode.dark;
    }
  }
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
class MyTheme{
  static final darkTheme=ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Color(0xffc4c4c4)
    ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(),
      hintColor: Color(0xffdcdcdc),
    indicatorColor: Color(0xffd0d0d0),
    tabBarTheme: TabBarTheme(unselectedLabelColor: Color(0xffd5d5d5)),
  );
  static final lightTheme=ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.green[900],
      unselectedItemColor: Color(0xffafafaf)
    ),
    colorScheme: ColorScheme.light(),
    tabBarTheme: TabBarTheme(unselectedLabelColor:Colors.black38,labelColor: Colors.black54),
      indicatorColor: Color(0xff4e4e4e),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color:Colors.black54,fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black54))
    ),

  );


}