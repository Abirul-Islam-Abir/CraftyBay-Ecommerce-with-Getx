import 'dart:math';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

extension SizeExtension on num {
  static final _screenSizes = ScreenSizes();

  ///* Get the `width` by percentage of screen width `10.w`
  double get w => _screenSizes.getWidth(this);

  ///* Get the `height` by percentage of screen height `10.h`
  double get h => _screenSizes.getHeight(this);

  ///* Get the `relative width` by pixels of screen width
  double get rw => _screenSizes.getRelativeWidth(this);

  ///* Get the `relative height` by pixels of screen height
  double get rh => _screenSizes.getRelativeHeight(this);

  ///* Get the responsive `font-size` for based on scale and screen size
  double get rSp => _screenSizes.getRelativeFontSize(this);
}

class ScreenSizes {
  static final ScreenSizes _screenSizes = ScreenSizes._();

  ScreenSizes._();

  factory ScreenSizes() => _screenSizes;

  static late double screenWidth;
  static late double screenHeight;

  final Size _designSize = const Size(390, 844);

  Size get designSize => _designSize;

  double get scaleWidth => screenWidth / designSize.width;

  double get scaleHeight => screenHeight / designSize.height;

  double getRelativeWidth(num size) => size * scaleWidth;

  double getRelativeHeight(num size) => size * scaleHeight;

  double getRelativeFontSize(num size) => size * min(scaleWidth, scaleHeight);

  double getWidth(num size) => size * screenWidth / 100;

  double getHeight(num size) => size * screenHeight / 100;

  static bool get isTablet => 100.w > 600;
}
