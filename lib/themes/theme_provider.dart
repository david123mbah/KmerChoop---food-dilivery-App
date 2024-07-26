import 'package:flutter/material.dart';
import 'package:musicapp/themes/dark_theme.dart';
import 'package:musicapp/themes/light_mode.dart';



class ThemeProvider with ChangeNotifier{
   ThemeData _themeData = lightMode;
  ThemeData  get themeData => _themeData;

  bool get isDarkMode => _themeData == darktMode;

   set themeData (ThemeData themeData)  {
    _themeData = themeData;
    notifyListeners();
   }

   




}