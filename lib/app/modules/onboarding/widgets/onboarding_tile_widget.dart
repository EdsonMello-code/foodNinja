import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/app/core/theme/app_theme.dart';

import '../../../core/widgets/button_widget.dart';
import '../../../core/widgets/text_widget.dart';

class OnboardingTileWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageUrl;
  final String title;
  final String subtitle;
  final double titleContainerSize;

  const OnboardingTileWidget({
    super.key,
    required this.onPressed,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.titleContainerSize = 211,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SvgPicture.asset(
          imageUrl,
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          width: titleContainerSize,
          height: 58,
          child: TextWidget.inter(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 42.0),
          child: SizedBox(
            width: 244,
            child: TextWidget.inter(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ButtonWidget(
          onPressed: onPressed,
          text: 'Next',
        )
      ],
    );
  }
}
