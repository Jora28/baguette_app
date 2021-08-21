import 'package:flutter/material.dart';

/// Defines the color palette for the History of Adventure's UI.
abstract class AppColors {
  /// White
  static const Color white = Color(0xffffffff);

  // Withe 54%
  static const white54 = Color(0xFFE5E7EC);
  
  //Red
  static const red = Color(0xFFA22752);

  // Blue
  static const blue = Color(0xFF006171);

  // Gold 
  static const gold = Color(0xFFbAA769);

  /// Black
  static const Color black = Color(0x8A000000);


  /// Green
  static const Color green = Color(0xff55B791);

  /// Orange
  static const Color orange = Color(0xffFF8A00);


  /// Grey
  static const Color grey = Color(0xffD0CACB);

  /// Deep grey
  static const Color greyDeep = Color(0xff2E2E2E);

  // Transparent
  static const Color transpatent = Colors.transparent;

  static const LinearGradient linearGradient1 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffFFE55B),
        Color(0xffFF9B25),
        Color(0xffE05E00),
        Color(0xffD13200)
      ]);
  static const LinearGradient linearGradient2 =
      LinearGradient(colors: [greyDeep, greyDeep]);

  static const LinearGradient linearGradientForBackground =
      LinearGradient(colors: [
    Color.fromRGBO(255, 255, 255, 0.1),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.7),
    Color.fromRGBO(255, 255, 255, 0.28)
  ]);

  static const LinearGradient linearGradientForBackgroundDocument =
      LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.8),
      Color.fromRGBO(255, 255, 255, 0.8),
      // Color.fromRGBO(255, 255, 255, 0.5),

      //radial-gradient(50% 50% at 50% 50%, rgba(255, 255, 255, 0.6) 0%, rgba(255, 255, 255, 0.4)
    ],
    end: Alignment.bottomLeft,
  );
}
