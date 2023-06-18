import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

import '../../../core/widgets/back_button_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final themeData = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          constraints: BoxConstraints(
            minHeight: size.height - (padding.bottom + padding.top),
          ),
          padding: padding,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: themeData.brightness == Brightness.light
                  ? const AssetImage(
                      'assets/images/splash_background.png',
                    )
                  : const AssetImage(
                      'assets/images/background_splash_dark.png',
                    ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 38.0,
                        bottom: 20.0,
                      ),
                      child: BackButtonWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: SizedBox(
                        width: 261,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget.inter(
                              'Reset your password here',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextWidget.inter(
                              'Select which contact details should we use to reset your password',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TextFieldWidget(
                      hint: 'New Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextFieldWidget(
                      hint: 'Confirm Password',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Center(
                  child: ButtonWidget(
                    text: 'Next',
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        '/verification-code',
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
