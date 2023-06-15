import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

import '../widgets/via_method_card_widget.dart';

class ViaMethodPage extends StatelessWidget {
  const ViaMethodPage({super.key});

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
          color: Color(0xFFFEFEFF),
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
                  SizedBox(
                    width: 224,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: TextWidget.inter(
                            'Forgot password?',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ViaMethodCardWidget(
                      padding: const EdgeInsets.symmetric(
                        vertical: 26,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23.0),
                            child: SvgPicture.asset(
                              'assets/images/message.svg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: TextWidget.inter(
                                    'Via sms:',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                TextWidget.inter(
                                  '**** **** 4235',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: ViaMethodCardWidget(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23.0),
                            child: SvgPicture.asset(
                              'assets/images/email_icon.svg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: TextWidget.inter(
                                    'Via email:',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                TextWidget.inter(
                                  '**** @gmail.com',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: ButtonWidget(
                text: 'Next',
              ),
            )
          ],
        ),
      ),
    );
  }
}
