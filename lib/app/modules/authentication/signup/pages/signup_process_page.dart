import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

import '../../../../core/utils/input_mask_formatter.dart';

class SignupProcessPage extends StatelessWidget {
  const SignupProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: SingleChildScrollView(
        child: Container(
          padding: padding.copyWith(
            top: padding.top,
          ),
          child: Stack(
            children: [
              Positioned(
                right: -30,
                child: Image.asset(
                  'assets/images/background_signup_process.png',
                  width: size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 38.0,
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight:
                        size.height - (padding.top + padding.bottom + 38.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                    'Fill in your bio to get started',
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
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFieldWidget(
                              controller: TextEditingController(),
                              hint: 'First Name',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFieldWidget(
                              controller: TextEditingController(),
                              hint: 'Last Name',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFieldWidget(
                              controller: TextEditingController(),
                              hint: 'Mobile Number',
                              textInputFormatter: [
                                InputMaskFormatter.phone(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60.0),
                        child: ButtonWidget(
                          text: 'Next',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/payment-method');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
