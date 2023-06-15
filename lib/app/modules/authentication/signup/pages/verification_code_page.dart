import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_time_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/authentication/signup/widgets/sequence_inputs_widget.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          constraints: BoxConstraints(
            minHeight: size.height,
          ),
          padding: padding.copyWith(
            left: 25,
            top: 38,
          ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButtonWidget(),
                  SizedBox(
                    width: 266,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 19.0,
                            top: 20.0,
                          ),
                          child: TextWidget.inter(
                            'Enter 4-digit Verification code',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        TextTimeWidget(
                          text:
                              'Code send to +6282045**** . This code will expired in ',
                          dateTime: DateTime(
                            0,
                            0,
                            0,
                            0,
                            01,
                            30,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 38.0),
                    child: SequenceInputsWidget(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Center(
                  child: ButtonWidget(
                    text: 'Try Order',
                    onPressed: () {},
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
