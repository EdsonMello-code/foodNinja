import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/default_animation_card_widget.dart';

class HomeSpecialDealCardWidget extends StatelessWidget {
  final Widget child;

  const HomeSpecialDealCardWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return DefaultAnimationCardWidget(
      duration: const Duration(
        milliseconds: 600,
      ),
      child: SizedBox(
        height: 150,
        width: size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.appTheme.darkGreen,
                    context.appTheme.green,
                  ],
                ),
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: child,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.3,
                  child: SvgPicture.asset(
                    'assets/images/background_sliced_left.svg',
                  ),
                ),
                Opacity(
                  opacity: 0.3,
                  child: SvgPicture.asset(
                    'assets/images/home_card_background.svg',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
