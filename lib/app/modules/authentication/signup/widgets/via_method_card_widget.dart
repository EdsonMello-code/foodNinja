import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';

class ViaMethodCardWidget extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;

  const ViaMethodCardWidget({
    super.key,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
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
      child: Container(
        width: size.width,
        padding: padding,
        decoration: BoxDecoration(
          color: context.appTheme.white,
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
        child: child,
      ),
    );
  }
}
