import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/success_widget.dart';

class SignupSuccessNotificationPage extends StatelessWidget {
  const SignupSuccessNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessPage(
        title: 'Your Profile Is Ready To Use',
        buttonTitle: 'Try Order',
        onPressed: () {},
      ),
    );
  }
}
