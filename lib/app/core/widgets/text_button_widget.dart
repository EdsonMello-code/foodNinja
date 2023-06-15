import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const TextButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: TextWidget.inter(
        text,
        decoration: TextDecoration.underline,
        style: TextStyle(
          color: context.appTheme.green,
        ),
      ),
    );
  }
}
