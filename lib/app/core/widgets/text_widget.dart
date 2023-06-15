import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatefulWidget {
  final TextStyle style;
  final String text;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final bool isTextAnimated;
  const TextWidget._(
    this.text, {
    required this.style,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.isTextAnimated = true,
  });

  factory TextWidget.inter(
    String text, {
    TextStyle style = const TextStyle(
      color: Color(0xFF09051C),
    ),
    TextAlign? textAlign,
    TextDecoration decoration = TextDecoration.none,
    bool isTextAnimated = true,
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
      isTextAnimated: isTextAnimated,
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
      isTextAnimated: isTextAnimated,
    );
  }
  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String _displayText = '';
  final key = UniqueKey();

  @override
  void initState() {
    super.initState();
    widget.isTextAnimated ? _startAnimation() : null;
  }

  Future<void> _startAnimation() async {
    if (mounted) {
      String text = widget.text;
      for (int i = 0; i < text.length; i++) {
        await Future.delayed(const Duration(milliseconds: 20));
        if (mounted) {
          setState(() {
            _displayText = text.substring(0, i + 1);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      key: key,
      widget.isTextAnimated ? _displayText : widget.text,
      textAlign: widget.textAlign,
      style: widget.style.copyWith(
        decorationThickness: 1,
        decoration: widget.decoration,
      ),
    );
  }
}
