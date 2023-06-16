import 'package:flutter/material.dart';

class DefaultAnimationCardWidget extends StatefulWidget {
  final Widget child;

  final Duration duration;

  const DefaultAnimationCardWidget(
      {super.key,
      required this.child,
      this.duration = const Duration(milliseconds: 1000)});

  @override
  State<DefaultAnimationCardWidget> createState() =>
      _DefaultAnimationCardWidgetState();
}

class _DefaultAnimationCardWidgetState
    extends State<DefaultAnimationCardWidget> {
  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      duration: widget.duration,
      tween: Tween(
        begin: 0.0,
        end: 1,
      ),
      child: widget.child,
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
