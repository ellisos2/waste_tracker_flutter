import 'package:flutter/material.dart';

class Styles {

  static const _textSizeLarge = 36.0;
  static const _textSizeMedium = 20.0;
  static const _textSizeSmall = 15.0;
  static const Color _textColorDefault = Colors.black;
  static const Color _textColorBright = Colors.white;
  static const String _fontLora = 'Lora';
  static const String _fontCuprum = 'Cuprum';

  static const lightModeText = TextTheme(
    titleLarge: largeLightText,
    bodyLarge: largeBodyText,
    bodyMedium: mediumBodyText,
    bodySmall: smallBodyText
  );

  static const darkModeText = TextTheme(
    titleLarge: largeLightText,
    bodyLarge: largeLightText,
    bodyMedium: mediumLightText,
    bodySmall: smallLightText 
  );

  static const smallBodyText = TextStyle(
    fontFamily: _fontLora,
    fontWeight: FontWeight.w400,
    fontSize: _textSizeSmall,
    color: _textColorDefault
  );

  static const mediumBodyText = TextStyle(
    fontFamily: _fontLora,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeMedium,
    color: _textColorDefault
  );

  static const largeBodyText = TextStyle(
    fontFamily: _fontCuprum,
    fontWeight: FontWeight.w800,
    fontSize: _textSizeLarge,
    color: _textColorDefault
  );

  static const headerText = TextStyle(
    fontFamily: _fontLora,
    fontWeight: FontWeight.w800,
    fontSize: _textSizeLarge,
    color: _textColorBright
  );

  static const smallLightText = TextStyle(
    fontFamily: _fontLora,
    fontWeight: FontWeight.w400,
    fontSize: _textSizeSmall,
    color: _textColorBright
  );

  static const mediumLightText = TextStyle(
    fontFamily: _fontLora,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeMedium,
    color: _textColorBright
  );

  static const largeLightText = TextStyle(
    fontFamily: _fontCuprum,
    fontWeight: FontWeight.w800,
    fontSize: _textSizeLarge,
    color: _textColorBright
  );

}