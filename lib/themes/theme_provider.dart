import 'package:flutter/material.dart';
import 'package:musicapp/themes/dark_theme.dart';
import 'package:musicapp/themes/light_mode.dart';



class ThemeProvider with ChangeNotifier{
   ThemeData _themeData = darkMode;
  ThemeData  get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

   set themeData (ThemeData themeData)  {
    _themeData = themeData;
    notifyListeners();
   }
   void toggleTheme() {
    if (_themeData == darkMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
   }
}