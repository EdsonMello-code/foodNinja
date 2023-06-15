import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isUnderline;
  final TextStyle style;

  const TextButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isUnderline = true,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: TextWidget.inter(
        text,
        decoration:
            isUnderline ? TextDecoration.underline : TextDecoration.none,
        style: style.copyWith(
          color: context.appTheme.green,
        ),
      ),
    );
  }
}
