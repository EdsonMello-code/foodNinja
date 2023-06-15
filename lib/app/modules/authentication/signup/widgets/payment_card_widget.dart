import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';

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

    return InkWell(
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
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(
                20,
                90,
                108,
                234,
              ),
              blurRadius: 50,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
