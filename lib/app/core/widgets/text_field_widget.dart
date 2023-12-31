import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter> textInputFormatter;
  final TextInputType textInputType;
  final List<BoxShadow>? boxShadow;
  final InputBorder? border;
  final double height;
  final TextAlign textAlign;
  final TextStyle? style;
  final int? maxLength;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? hintColor;
  final EdgeInsets? contentPadding;

  const TextFieldWidget({
    super.key,
    this.controller,
    this.hint = '',
    this.prefix,
    this.suffix,
    this.textInputFormatter = const [],
    this.textInputType = TextInputType.text,
    this.boxShadow,
    this.border,
    this.height = 57,
    this.textAlign = TextAlign.start,
    this.style,
    this.maxLength,
    this.focusNode,
    this.fillColor,
    this.hintColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: themeData.brightness == Brightness.light
            ? boxShadow ??
                [
                  const BoxShadow(
                    color: Color.fromARGB(
                      20,
                      90,
                      108,
                      234,
                    ),
                    blurRadius: 50,
                  ),
                ]
            : null,
      ),
      height: height,
      child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0, end: 1),
          child: TextFormField(
            inputFormatters: textInputFormatter,
            focusNode: focusNode,
            controller: controller,
            expands: true,
            maxLines: null,
            maxLength: maxLength,
            textAlign: textAlign,
            keyboardType: textInputType,
            enableIMEPersonalizedLearning: true,
            cursorColor: context.appTheme.orange,
            autocorrect: true,
            textCapitalization: TextCapitalization.sentences,
            style: GoogleFonts.inter(
              color: themeData.brightness == Brightness.light
                  ? const Color(0xFF3B3B3B)
                  : Colors.white.withOpacity(0.8),
            ).merge(style),
            decoration: InputDecoration(
              fillColor: fillColor ?? theme.white,
              filled: true,
              counterText: '',
              hintText: hint,
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 24,
                minHeight: 24,
              ),
              hintStyle: GoogleFonts.inter(
                color: hintColor ?? theme.lightBlack,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: contentPadding ??
                  const EdgeInsets.only(
                    top: 18,
                    bottom: 18,
                    left: 20,
                  ),
              prefixIcon: prefix != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 16.0,
                      ),
                      child: prefix,
                    )
                  : null,
              suffixIcon: suffix,
              focusedBorder: border ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.green,
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
              enabledBorder: border ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: themeData.brightness == Brightness.light
                          ? const Color(0xFFF4F4F4)
                          : context.appTheme.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
              border: border ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: themeData.brightness == Brightness.light
                          ? const Color(0xFFF4F4F4)
                          : context.appTheme.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
            ),
          ),
          builder: (context, value, child) {
            final interpolation = lerpDouble(0.8, 1.0, value);

            return AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: value,
              child: Transform.scale(
                scale: interpolation,
                alignment: Alignment.center,
                child: child,
              ),
            );
          }),
    );
  }
}
