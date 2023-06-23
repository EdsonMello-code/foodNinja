import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatefulWidget {
  final TextStyle style;
  final String text;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  const TextWidget._(
    this.text, {
    required this.style,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
  });

  factory TextWidget.inter(
    String text, {
    TextStyle style = const TextStyle(
      color: Color(0xFF09051C),
    ),
    TextAlign? textAlign,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextWidget._(
      text,
      style: GoogleFonts.inter(
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        color: style.color,
      ),
      textAlign: textAlign,
      decoration: decoration,
    );
  }

  factory TextWidget.rubik(
    String text, {
    TextStyle style = const TextStyle(
      color: Color(0xFF09051C),
    ),
    TextAlign? textAlign,
    TextDecoration decoration = TextDecoration.none,
    bool isTextAnimated = false,
  }) {
    return TextWidget._(
      text,
      style: GoogleFonts.rubik(
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        color: style.color,
      ),
      textAlign: textAlign,
      decoration: decoration,
    );
  }
  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final key = UniqueKey();
  late Stream<String> stream;

  @override
  void initState() {
    super.initState();
    // widget.isTextAnimated ? _startAnimation() : null;
    stream = _startAnimation();
  }

  Stream<String> _startAnimation() async* {
    String text = widget.text;
    String displayText = '';

    for (int i = 0; i < text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      displayText = text.substring(0, i + 1);
      yield displayText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return Text(
              key: key,
              '',
              textAlign: widget.textAlign,
              style: widget.style.copyWith(
                decorationThickness: 1,
                decoration: widget.decoration,
              ),
            );
          }

          return Text(
            key: key,
            data,
            textAlign: widget.textAlign,
            style: widget.style.copyWith(
              decorationThickness: 1,
              decoration: widget.decoration,
            ),
          );
        });
  }
}
