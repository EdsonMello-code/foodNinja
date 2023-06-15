import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/default_animation_card_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class LocationButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const LocationButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DefaultAnimationCardWidget(
      child: Material(
        type: MaterialType.button,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          child: Ink(
            width: size.width,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0XFFF6F6F6),
            ),
            child: Center(
              child: TextWidget.rubik(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
