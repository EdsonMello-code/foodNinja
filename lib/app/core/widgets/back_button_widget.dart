import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;

  const BackButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  State<BackButtonWidget> createState() => _BackButtonWidgetState();
}

class _BackButtonWidgetState extends State<BackButtonWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        ));

    animationController.addListener(updateScreenListerner);
    animationController.forward();
  }

  void updateScreenListerner() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Transform.scale(
      scale: animationController.value,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: widget.onPressed ??
              () {
                Navigator.of(context).pop();
              },
          child: Ink(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: themeData.brightness == Brightness.dark
                  ? const Color(0xFFF9A84D).withOpacity(0.1)
                  : const Color(0xFFFDF5ED),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/back_icon.svg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
