import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Size size;

  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.size = const Size(157, 57),
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final defaultFontStyle = TextStyle(
      color: theme.white,
      fontFamily: 'BentonSans',
      fontSize: 16,
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
            borderRadius: BorderRadius.circular(15),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: onPressed == null
                    ? LinearGradient(
                        colors: [
                          theme.darkGreen.withOpacity(0.3),
                          theme.green.withOpacity(0.3),
                        ],
                      )
                    : LinearGradient(
                        colors: [
                          theme.darkGreen,
                          theme.green,
                        ],
                      ),
              ),
              width: size.width,
              height: size.height,
              child: Center(
                child: TextWidget.inter(
                  text,
                  style: defaultFontStyle,
                  isTextAnimated: false,
                ),
              ),
            ),
          ),
        ),
        builder: (context, value, child) {
          final interpolation = lerpDouble(0.8, 1.0, value);

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
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
