import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';

class HomeButtonFilterWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const HomeButtonFilterWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Material(
      color: Colors.transparent,
      type: MaterialType.button,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: themeData.brightness == Brightness.light
                ? const Color(0xFFFEF6ED)
                : context.appTheme.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: SvgPicture.asset(
              themeData.brightness == Brightness.light
                  ? 'assets/images/filter.svg'
                  : 'assets/images/filter_dark.svg',
            ),
          ),
        ),
      ),
    );
  }
}
