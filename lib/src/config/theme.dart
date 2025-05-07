import 'package:flutter/material.dart';
import 'package:raghuvir_developers/src/config/font_sizes.dart';

import 'package:raghuvir_developers/src/config/pallete.dart';

class ThemeConfig {
  ThemeConfig._();

  /// Light style
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Palette.primaryColor,
      onPrimary: Palette.white,
      secondary: Palette.primaryColor,
      onSecondary: Palette.white,
      error: Palette.errorColor,
      onError: Palette.white,
      surface: Palette.white,
      onSurface: Palette.black,
    ),
    dividerTheme: const DividerThemeData(color: Palette.borderColor),
    inputDecorationTheme: _inputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // fontFamily: GoogleFonts.aBeeZee().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.primaryColor,
      foregroundColor: Palette.white,
    ),
    tabBarTheme: const TabBarTheme(unselectedLabelColor: Palette.inactiveColor),
    chipTheme: const ChipThemeData(
      checkmarkColor: Palette.black,
      labelStyle: TextStyle(color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Palette.primaryColor,
      selectedItemColor: Palette.white,
      unselectedItemColor: Palette.inactiveColor,
      // unselectedLabelStyle: GoogleFonts.aBeeZee(
      //   fontSize: FontSizes.body1,
      //   height: 1,
      //   color: Palette.inactiveColor,
      // ),
      // selectedLabelStyle: GoogleFonts.aBeeZee(
      //   fontSize: FontSizes.body1,
      //   height: 1,
      //   color: Palette.white,
      // ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Palette.primaryColor,
        foregroundColor: Palette.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        foregroundColor: Palette.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(color: Palette.borderColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    textTheme: _textTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.darkPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Palette.black),
  );

  /// App theme data
  ///
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Palette.darkPrimaryColor,
      onPrimary: Palette.white,
      secondary: Palette.white,
      onSecondary: Palette.white,
      error: Palette.errorColor,
      onError: Palette.white,
      surface: Palette.darkPrimaryColor,
      onSurface: Palette.white,
    ),
    inputDecorationTheme: _darkInputDecorationTheme,
    // fontFamily: GoogleFonts.aBeeZee().fontFamily,
    tabBarTheme: const TabBarTheme(
      indicatorColor: Palette.white,
      labelColor: Palette.white,
      unselectedLabelColor: Palette.darkInactiveColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.darkPrimaryColor,
      selectedItemColor: Palette.white,
      unselectedItemColor: Palette.darkInactiveColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Palette.darkPrimaryColor,
        foregroundColor: Palette.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    chipTheme: const ChipThemeData(
      secondaryLabelStyle: TextStyle(color: Palette.black),
      checkmarkColor: Palette.black,
      // selectedColor: Colors.black,
      // labelStyle: TextStyle(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        foregroundColor: Palette.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(color: Palette.borderColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    radioTheme: const RadioThemeData(
      fillColor: WidgetStatePropertyAll(Palette.white),
    ),
    checkboxTheme: const CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(Palette.white),
      checkColor: WidgetStatePropertyAll(Palette.darkPrimaryColor),
    ),
    // textTheme: GoogleFonts.aBeeZeeTextTheme()
    //     .apply(bodyColor: Palette.white, displayColor: Palette.white)
    //     .merge(_textTheme),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.darkPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    dialogTheme: DialogThemeData(backgroundColor: Palette.darkPrimaryColor),
  );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: Palette.greyLight, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Palette.greyLight, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Palette.greyLight, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Palette.redColor, width: 1.5),
    ),
    hintStyle: const TextStyle(
      color: Palette.inputHintColor,
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.body2,
    ),
    labelStyle: const TextStyle(color: Palette.inputHintColor),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    errorStyle: const TextStyle(
      color: Palette.redColor,
      fontWeight: FontWeight.bold,
    ),
  );

  static InputDecorationTheme get _darkInputDecorationTheme =>
      InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          color: Palette.inputHintColor,
          fontWeight: FontWeight.w600,
          fontSize: FontSizes.body1,
        ),
        labelStyle: const TextStyle(color: Palette.inputHintColor),
        filled: true,
        fillColor: Palette.primaryColor.shade200,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      );

  static const TextTheme _textTheme = TextTheme(
    labelLarge: TextStyle(
      fontSize: FontSizes.button,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(fontSize: FontSizes.body1),
    bodyMedium: TextStyle(fontSize: FontSizes.body2),
    displayLarge: TextStyle(
      fontSize: FontSizes.headline1,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: FontSizes.headline2,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: FontSizes.headline3,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: FontSizes.headline4,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: FontSizes.headline5,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: FontSizes.headline6,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(fontSize: FontSizes.subtitle1),
    titleSmall: TextStyle(fontSize: FontSizes.subtitle2),
    bodySmall: TextStyle(fontSize: FontSizes.medium),
  );
}
