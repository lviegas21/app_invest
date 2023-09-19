import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final backgroundColor = Color(0xFFFFF6EE);
  final primaryColor = Colors.white;
  final buttonColor = Color(0xFF0C274D);
  final secondaryHeaderColor = Colors.black87;
  final blue = Color(0xFF31A7C1);
  final fontFamily = "Reem Kufi";

  dynamic textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: primaryColor,
      fontFamily: fontFamily,
    ),
    headline2: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: primaryColor,
      fontFamily: fontFamily,
    ),
    headline3: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: primaryColor,
      fontFamily: fontFamily,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: primaryColor,
      fontFamily: fontFamily,
    ),
    bodyText1: TextStyle(
      color: primaryColor,
      fontFamily: fontFamily,
    ),
    button: TextStyle(
      color: Colors.white,
      fontFamily: fontFamily,
    ),
    caption: TextStyle(
      color: primaryColor,
      fontFamily: fontFamily,
    ),
  );

  final iconTheme = IconThemeData(
    color: buttonColor,
  );

  final appBarTheme = AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: secondaryHeaderColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Comfortaa',
    ),
    backgroundColor: Color.fromRGBO(71, 82, 99, 100),
    elevation: 0,
  );

  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: primaryColor),
    buttonColor: buttonColor,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
  return ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryHeaderColor,
    primarySwatch: Colors.red,
    dividerColor: Colors.grey,
    backgroundColor: backgroundColor,
    textTheme: textTheme,
    buttonTheme: buttonTheme,
    iconTheme: iconTheme,
    appBarTheme: appBarTheme,
  );
}
