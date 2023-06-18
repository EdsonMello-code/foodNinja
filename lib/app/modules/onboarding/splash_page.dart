import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Timer timer;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener(statusAnimationListerner);

    animationController.addListener(updateScreenListerner);
    animationController.forward();
    timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/first-step-onboarding');
    });
    // timer.cancel();
  }

  void statusAnimationListerner(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.forward ||
        status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  void updateScreenListerner() {
    setState(() {});
  }

  @override
  void dispose() {
    animationController.removeListener(updateScreenListerner);
    animationController.removeStatusListener(statusAnimationListerner);
    animationController.dispose();
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final interpolation = lerpDouble(0.5, 1, animationController.value);

    final themeData = Theme.of(context);

    return Scaffold(
      extendBody: true,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: themeData.brightness == Brightness.light
                ? const AssetImage('assets/images/splash_background.png')
                : const AssetImage('assets/images/background_splash_dark.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Transform.scale(
          scale: interpolation,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
