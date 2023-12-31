import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';

class NotificationServiceWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const NotificationServiceWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.button,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Ink(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: context.appTheme.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/notification_icon.svg',
              alignment: Alignment.topRight,
            ),
          ),
        ),
      ),
    );
  }
}
