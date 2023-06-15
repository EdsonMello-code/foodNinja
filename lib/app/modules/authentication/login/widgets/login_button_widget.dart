import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const LoginButtonWidget({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        child: Ink(
          padding: const EdgeInsets.all(16),
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.appTheme.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: context.appTheme.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: child,
              ),
              TextWidget.inter(
                'Facebook',
              )
            ],
          ),
        ),
      ),
    );
  }
}
