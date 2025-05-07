import 'package:flutter/material.dart';

class Palette {
  Palette._();

  // Primary color swatches
  static const Map<int, Color> primaryColorSwatch = {
    50: Color.fromRGBO(63, 82, 137, .1),
    100: Color.fromRGBO(63, 82, 137, .2),
    200: Color.fromRGBO(63, 82, 137, .3),
    300: Color.fromRGBO(63, 82, 137, .4),
    400: Color.fromRGBO(63, 82, 137, .5),
    500: Color.fromRGBO(63, 82, 137, .6),
    600: Color.fromRGBO(63, 82, 137, .7),
    700: Color.fromRGBO(63, 82, 137, .8),
    800: Color.fromRGBO(63, 82, 137, .9),
    900: Color.fromRGBO(63, 82, 137, 1),
  };

  // Primary color
  static const MaterialColor primaryColor = MaterialColor(
    0xFF3F5289,
    primaryColorSwatch,
  );

  /// White color
  static const Color white = Color(0xFFFFFFFF);

  /// White color
  static const Color black = Color(0xFF000000);

  ///project grey color
  static const Color greyLight = Color(0xFFCED4DA);

  static const Color grey = Colors.grey;

  static const Color transparent = Colors.transparent;

  ///
  static const Color textLightThemeColor = Color(0xff2A2A2A);

  ///
  static const Color textDarkThemeColor = Colors.white;

  //
  static const Color inputHintColor = Color(0xFF888A99);

  /// Button overlayColor
  static const Color buttonOverlayColor = Color.fromRGBO(0, 0, 0, 0.05);

  /// Inactive color
  static const Color inactiveColor = Color(0xFF5A5A5A);

  /// Border color
  static const Color borderColor = Color(0xFFE6E6E6);

  /// Inactive color
  static const Color shadowColor = Color.fromRGBO(22, 22, 22, .15);

  ///
  static const Color pinkColor = Color(0xFFe86c6f);

  ///Profile view text color
  static const Color profileViewTextColor = Color(0xFFc8c8c8);

  ///red color
  static const Color redColor = Colors.red;

  /// Error Border color
  static const Color errorColor = Color(0xFFF44336);

  /// Error Border color
  static const Color facebookBrandColor = Color(0xFF4267B2);

  ///splsh colors
  static const Color splashColor1 = Palette.black;
  static const Color splashColor2 = Palette.grey;

  // Primary color swatches
  static const Map<int, Color> darkPrimaryColorSwatch = {
    50: Color.fromRGBO(41, 50, 61, .1),
    100: Color.fromRGBO(41, 50, 61, .2),
    200: Color.fromRGBO(41, 50, 61, .3),
    300: Color.fromRGBO(41, 50, 61, .4),
    400: Color.fromRGBO(41, 50, 61, .5),
    500: Color.fromRGBO(41, 50, 61, .6),
    600: Color.fromRGBO(41, 50, 61, .7),
    700: Color.fromRGBO(41, 50, 61, .8),
    800: Color.fromRGBO(41, 50, 61, .9),
    900: Color.fromRGBO(41, 50, 61, 1),
  };

  static const MaterialColor darkPrimaryColor = MaterialColor(
    0xFF29323D,
    darkPrimaryColorSwatch,
  );
  static const Color darkCardColor = Color(0xFF0E0E0F);
  static const Color darkDividerColor = Color(0xFF545454);
  static const Color darkActiveColor = Color(0xFFFFFFFF);
  static const Color darkInactiveColor = Color(0xFF717B84);


  ///Login
  static const Color loginBgColor = Color(0xFFF3F3F8);


  ///Automation process
    static const Color automationYellow = Color(0xFFFFD602);


}
