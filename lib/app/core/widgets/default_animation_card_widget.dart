import 'package:flutter/material.dart';

class DefaultAnimationCardWidget extends StatelessWidget {
  final Widget child;

  const DefaultAnimationCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(
        begin: 0.0,
        end: 1,
      ),
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
    );
  }
}
