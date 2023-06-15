import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class SignupSuccessNotificationPage extends StatelessWidget {
  const SignupSuccessNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);

    return Scaffold(
      body: Container(
        width: size.width,
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        padding: padding,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              'assets/images/splash_background.png',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 33.0),
                  child: Image.asset(
                    'assets/images/complete_ilustration.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextWidget.inter(
                    'Congrats!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: context.appTheme.darkGreen,
                    ),
                  ),
                ),
                TextWidget.inter(
                  'Your Profile Is Ready To Use',
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ButtonWidget(
                text: 'Try Order',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
