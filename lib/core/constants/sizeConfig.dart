import 'package:flutter/material.dart';

class SizeConfig {
  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._();

  static  late SizeConfig _instance;
  static const int defaultWidth = 1080;
  static const int defaultHeight = 1920;

  /// Size of the phone in UI Design , px
  num uiWidthPx = 0;
  num uiHeightPx = 0;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  bool allowFontScaling =false;

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;
  static const double appHPadding = 16;
  static const double walletStrapWidth = 85;
  static const double walletStrapHeight = 100;
  static const double perspectiveSm = 0.0005;
  static const double perspective = 0.001;
  static const double perspectiveLg = 0.002;

  static void init(BuildContext context,
      {num width = defaultWidth,
        num height = defaultHeight,
        bool allowFontScaling = false}) {
    _instance = SizeConfig._();
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidthDp => _screenWidth;

  ///The vertical extent of this size. dp
  static double get screenHeightDp => _screenHeight;

  /// The vertical extent of this size. px
  static double get screenWidth => _screenWidth * _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenHeight => _screenHeight * _pixelRatio;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => _screenWidth / uiWidthPx;

  double get scaleHeight => _screenHeight / uiHeightPx;

  double get scaleText => scaleWidth;

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num sw(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  num sh(num height) => height * scaleHeight;

  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  num sp(num fontSize, {bool? allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScalingSelf
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor));

}
