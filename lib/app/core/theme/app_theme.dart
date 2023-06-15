import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color orange;
  final Color deepOrange;
  final Color middleOrange;
  final Color lightOrange;

  final Color yellow;
  final Color deepYellow;
  final Color middleYellow;
  final Color lightYellow;

  final Color black;
  final Color deepBlack;
  final Color middleBlack;
  final Color lightBlack;

  final Color darkGreen;
  final Color green;
  final Color white;

  final Color grey;

  const AppTheme({
    required this.orange,
    required this.yellow,
    required this.black,
    required this.deepOrange,
    required this.middleOrange,
    required this.lightOrange,
    required this.deepYellow,
    required this.middleYellow,
    required this.lightYellow,
    required this.deepBlack,
    required this.middleBlack,
    required this.lightBlack,
    required this.darkGreen,
    required this.green,
    required this.white,
    required this.grey,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? orange,
    Color? yellow,
    Color? black,
    Color? deepOrange,
    Color? middleOrange,
    Color? lightOrange,
    Color? deepYellow,
    Color? middleYellow,
    Color? lightYellow,
    Color? deepBlack,
    Color? middleBlack,
    Color? lightBlack,
    Color? darkGreen,
    Color? green,
    Color? white,
    Color? grey,
  }) {
    // const Color(0xFF53E88B);
    // const Color(0xFF15BE77);
    return AppTheme(
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      black: black ?? this.black,
      deepBlack: deepBlack ?? this.deepBlack,
      deepOrange: deepOrange ?? this.deepOrange,
      middleOrange: middleOrange ?? this.middleOrange,
      lightOrange: lightOrange ?? this.lightOrange,
      deepYellow: deepYellow ?? this.deepYellow,
      lightBlack: lightBlack ?? this.lightBlack,
      lightYellow: lightYellow ?? this.lightYellow,
      middleBlack: middleBlack ?? this.middleBlack,
      middleYellow: middleYellow ?? this.middleYellow,
      darkGreen: darkGreen ?? this.darkGreen,
      white: white ?? this.white,
      green: green ?? this.green,
      grey: grey ?? this.grey,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant AppTheme? other,
    double t,
  ) {
    return AppTheme(
      orange: Color.lerp(orange, other!.orange, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      black: Color.lerp(black, other.black, t)!,
      deepOrange: Color.lerp(deepOrange, other.deepOrange, t)!,
      deepBlack: Color.lerp(deepBlack, other.deepBlack, t)!,
      deepYellow: Color.lerp(deepYellow, other.deepYellow, t)!,
      lightBlack: Color.lerp(lightBlack, other.lightBlack, t)!,
      lightOrange: Color.lerp(lightOrange, other.lightOrange, t)!,
      lightYellow: Color.lerp(lightYellow, other.lightYellow, t)!,
      middleBlack: Color.lerp(middleBlack, other.middleBlack, t)!,
      middleOrange: Color.lerp(middleOrange, other.middleOrange, t)!,
      middleYellow: Color.lerp(middleYellow, other.middleYellow, t)!,
      darkGreen: Color.lerp(darkGreen, other.darkGreen, t)!,
      white: Color.lerp(white, other.white, t)!,
      green: Color.lerp(green, other.green, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
    );
  }
}
