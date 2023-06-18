import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/checkbox_widget.dart';
import 'package:foodninja/app/core/widgets/text_button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final themeData = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: padding.copyWith(
            right: padding.right + 25,
            left: padding.left + 25,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: themeData.brightness == Brightness.light
                  ? const AssetImage('assets/images/splash_background.png')
                  : const AssetImage(
                      'assets/images/background_splash_dark.png',
                    ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 49.0),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: TextWidget.inter(
                  'Sign Up For Free',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextFieldWidget(
                  prefix: SvgPicture.asset(
                    'assets/images/avatar_user.svg',
                    width: 24,
                    height: 24,
                  ),
                  controller: textEditingController,
                  hint: 'Anamwp . . |',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFieldWidget(
                  controller: textEditingController,
                  hint: 'Email',
                  prefix: SvgPicture.asset(
                    'assets/images/email.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: TextFieldWidget(
                  controller: textEditingController,
                  hint: 'Password',
                  prefix: SvgPicture.asset(
                    'assets/images/lock.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 13.0,
                  top: 19.0,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: CheckBoxWidget(
                        initialValue: true,
                        onChanged: (value) {},
                      ),
                    ),
                    TextWidget.inter(
                      'Keep Me Signed In',
                      style: TextStyle(
                        color: context.appTheme.white.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: CheckBoxWidget(
                      initialValue: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TextWidget.inter(
                    'Email Me About Special Pricing',
                    style: TextStyle(
                      color: context.appTheme.white.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ButtonWidget(
                  text: 'Create Account',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup-process');
                  },
                ),
              ),
              TextButtonWidget(
                text: 'already have an account?',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
