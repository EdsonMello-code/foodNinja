import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/utils/unit.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class SnackBarService {
  static Unit showSuccess(
    BuildContext context,
    String message,
  ) {
    final themeData = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.appTheme.darkGreen,
        content: TextWidget.inter(
          message,
          style: TextStyle(
            color: themeData.brightness == Brightness.light
                ? context.appTheme.white
                : Colors.white,
          ),
        ),
      ),
    );
    return unit;
  }

  static Unit showFailure(
    BuildContext context,
    String message,
  ) {
    final themeData = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.appTheme.orange,
        content: TextWidget.inter(
          style: TextStyle(
            color: themeData.brightness == Brightness.light
                ? context.appTheme.white
                : Colors.white,
          ),
          message,
        ),
      ),
    );
    return unit;
  }
}
