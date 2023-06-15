import 'package:flutter/material.dart';

class CloseButtonImageWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const CloseButtonImageWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        16.0,
      ),
      child: Material(
        type: MaterialType.button,
        color: const Color(0xFFD3E1E4).withOpacity(0.7),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            width: 31,
            height: 31,
            child: const Icon(
              Icons.close,
              size: 12.0,
              color: Color(0xFFFEFEFF),
            ),
          ),
        ),
      ),
    );
  }
}
