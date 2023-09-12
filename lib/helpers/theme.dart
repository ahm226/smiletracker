import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    primaryColorLight: Colors.blue[100],
    primaryColorDark: Colors.blue[700],
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.black,
    hoverColor: Colors.blue[100],
    highlightColor: Colors.black,
    splashColor: Colors.black,
    unselectedWidgetColor: Colors.grey,
    disabledColor: Colors.grey,
    secondaryHeaderColor: Colors.blue[100],
    dialogBackgroundColor: Colors.white,
    indicatorColor: Colors.black,
    hintColor: Colors.grey,
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade700,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ).titleLarge,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        secondary: Colors.black,
      ),
      buttonColor: Colors.black,
      splashColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent)
        .copyWith(background: Colors.white)
        .copyWith(error: Colors.redAccent),
  );

  static final light = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    primaryColorLight: Colors.blue[100],
    primaryColorDark: Colors.blue[700],
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.blueAccent,
    hoverColor: Colors.blue[100],
    highlightColor: Colors.white,
    splashColor: Colors.white,
    unselectedWidgetColor: Colors.grey,
    disabledColor: Colors.grey,
    secondaryHeaderColor: Colors.blue[100],
    dialogBackgroundColor: Colors.white,
    indicatorColor: Colors.blue,
    hintColor: Colors.grey,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ).titleLarge,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
      buttonColor: Colors.blue,
      splashColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.cyan),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent)
        .copyWith(background: Colors.white)
        .copyWith(error: Colors.redAccent),
  );
}
