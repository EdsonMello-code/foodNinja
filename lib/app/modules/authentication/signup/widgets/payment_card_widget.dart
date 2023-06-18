import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/default_animation_card_widget.dart';

class PaymentCardWidget extends StatelessWidget {
  final double height;
  final Widget child;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const PaymentCardWidget({
    super.key,
    required this.child,
    this.onTap,
    this.height = 73,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return DefaultAnimationCardWidget(
      duration: const Duration(
        milliseconds: 600,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          22,
        ),
        child: Ink(
          width: size.width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? context.appTheme.white,
            borderRadius: BorderRadius.circular(
              22,
            ),
            boxShadow: themeData.brightness == Brightness.light
                ? const [
                    BoxShadow(
                      color: Color.fromARGB(
                        20,
                        90,
                        108,
                        234,
                      ),
                      blurRadius: 50,
                    ),
                  ]
                : [],
          ),
          child: child,
        ),
      ),
    );
  }
}
