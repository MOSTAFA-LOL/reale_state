import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realestate/screans/sign_up.dart';

class ThemeService {
  final lightTheme =
      ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor:Colors.white70,
        // cardColor: Colors.grey.shade400,
        // scrollbarTheme: ScrollbarThemeData(),
          hoverColor:Color(0xFF2E2E2E),
          
        colorScheme: ColorScheme.light(
          surface: Colors.blueGrey,
          primary: Colors.grey,
          secondary: Colors.blueGrey.shade200
        )
      );
  final darkTheme = 
  ThemeData.dark().copyWith(
        primaryColor: Colors.blue.shade300,
        appBarTheme: AppBarTheme(
        ),
        dividerColor: const Color.fromARGB(255, 129, 129, 129)
      );

  final _getStorage = GetStorage();
  final _darkThemeKey = "isDarkTheme";

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
