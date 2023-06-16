import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Size size;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;

  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.size = const Size(157, 57),
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final defaultFontStyle = TextStyle(
      color: theme.white,
      fontFamily: 'BentonSans',
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.bold,
    );
    return TweenAnimationBuilder<double>(
        duration: const Duration(seconds: 1),
        tween: Tween(
          begin: 0,
          end: 1.0,
        ),
        child: Material(
          type: MaterialType.button,
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: borderRadius ?? BorderRadius.circular(15),
            child: Ink(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius ?? BorderRadius.circular(15),
                gradient: onPressed == null
                    ? backgroundColor == null
                        ? LinearGradient(
                            colors: [
                              theme.darkGreen.withOpacity(0.3),
                              theme.green.withOpacity(0.3),
                            ],
                          )
                        : null
                    : backgroundColor == null
                        ? LinearGradient(
                            colors: [
                              theme.darkGreen,
                              theme.green,
                            ],
                          )
                        : null,
              ),
              width: size.width,
              height: size.height,
              child: Center(
                child: TextWidget.inter(
                  text,
                  style: defaultFontStyle.copyWith(
                    color: textColor,
                  ),
                  isTextAnimated: false,
                ),
              ),
            ),
          ),
        ),
        builder: (context, value, child) {
          final interpolation = lerpDouble(0.8, 1.0, value);

          return Opacity(
            opacity: value,
            child: Transform.scale(
              scale: interpolation,
              alignment: Alignment.center,
              child: child,
            ),
          );
        });
  }
}
