import 'package:analog_clock/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    accentColor: kAccentLightColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryLightColor,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: Colors.white, // scaffold 가 없을때를 이야기 하는 것 같다.
    iconTheme: IconThemeData(color: kAccentIconLightColor),
    accentIconTheme: IconThemeData(color: kAccentIconLightColor),
    primaryIconTheme: IconThemeData(color: kAccentIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: TextStyle(color: kBodyTextColorLight),
      bodyText2: TextStyle(color: kBodyTextColorLight),
      headline4: TextStyle(color: kTitleTextLightColor, fontSize: 32),
      headline1: TextStyle(color: kTitleTextLightColor, fontSize: 80),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    accentColor: kAccentDarkColor,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ),
    backgroundColor: Colors.black, // scaffold 가 없을때를 이야기 하는 것 같다.
    iconTheme: IconThemeData(color: kAccentIconDarkColor),
    accentIconTheme: IconThemeData(color: kAccentIconDarkColor),
    primaryIconTheme: IconThemeData(color: kAccentIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: TextStyle(color: kBodyTextColorDark),
      bodyText2: TextStyle(color: kBodyTextColorDark),
      headline4: TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      headline1: TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
);
