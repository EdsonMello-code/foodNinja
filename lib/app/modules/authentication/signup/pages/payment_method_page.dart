import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/authentication/signup/widgets/payment_card_widget.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        width: size.width,
        padding: padding.copyWith(
          top: padding.top,
        ),
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -8,
              child: Image.asset(
                'assets/images/background_sliced.png',
                width: size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 38.0,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: BackButtonWidget(),
                      ),
                      SizedBox(
                        width: 264,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 19.0),
                              child: TextWidget.inter(
                                'Payment Method',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextWidget.inter(
                              'This data will be displayed in your account profile for security',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 17.0,
                          top: 20.0,
                        ),
                        child: PaymentCardWidget(
                          onTap: () {},
                          child: Center(
                            child: Image.asset(
                              'assets/images/paypal.png',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17.0),
                        child: PaymentCardWidget(
                          onTap: () {},
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/visa.svg',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17.0),
                        child: PaymentCardWidget(
                          onTap: () {},
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/payment.svg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 60.0,
                      ),
                      child: ButtonWidget(
                        text: 'Next',
                        onPressed: () {
                          Navigator.of(context).pushNamed('/upload-image');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
