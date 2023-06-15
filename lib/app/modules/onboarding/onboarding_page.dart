import 'package:flutter/material.dart';
import 'package:foodninja/app/modules/onboarding/widgets/onboarding_tile_widget.dart';

class FirstStepOnboardingPage extends StatefulWidget {
  const FirstStepOnboardingPage({super.key});

  @override
  State<FirstStepOnboardingPage> createState() =>
      _FirstStepOnboardingPageState();
}

class _FirstStepOnboardingPageState extends State<FirstStepOnboardingPage> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  List<Widget> get pages => [
        OnboardingTileWidget(
          imageUrl: 'assets/images/onboarding_first_step.svg',
          subtitle:
              'Here You Can find a chef or dish for every taste and color. Enjoy!',
          title: 'Find your  Comfort Food here',
          onPressed: () {
            controller.animateToPage(
              1,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        OnboardingTileWidget(
          titleContainerSize: 300,
          title: 'Food Ninja is Where Your Comfort Food Lives',
          subtitle: 'Enjoy a fast and smooth food delivery at your doorstep',
          imageUrl: 'assets/images/onboarding_two_step.svg',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/signup',
            );
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Container(
            padding: padding.copyWith(
              top: padding.top + 56,
            ),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];

                return page;
              },
            ),
          ),
        ),
      ),
    );
  }
}
