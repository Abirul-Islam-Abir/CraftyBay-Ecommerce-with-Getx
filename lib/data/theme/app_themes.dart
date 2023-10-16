import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

ThemeData mainTheme() => ThemeData(
    appBarTheme: globalAppBarTheme(),
    elevatedButtonTheme: globalElevatedButtonStyle(),
    inputDecorationTheme: globalInputDecorationTheme());

InputDecorationTheme globalInputDecorationTheme() => InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 02, color: AppColor.kPrimaryColor)),
    fillColor: AppColor.kGreyColor.shade200);

ElevatedButtonThemeData globalElevatedButtonStyle() => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shadowColor: AppColor.kTextColor,
        backgroundColor: AppColor.kPrimaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));

AppBarTheme globalAppBarTheme() => const AppBarTheme(
    backgroundColor: AppColor.kTransparentColor,
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: AppColor.kPrimaryColor),
    iconTheme: IconThemeData(color: AppColor.kTextColor),
    titleTextStyle: TextStyle(color: AppColor.kTextColor),
    centerTitle: false,
    elevation: 0);
