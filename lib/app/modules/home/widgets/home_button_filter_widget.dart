import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButtonFilterWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const HomeButtonFilterWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
            color: const Color(0xFFFEF6ED),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/filter.svg',
            ),
          ),
        ),
      ),
    );
  }
}
