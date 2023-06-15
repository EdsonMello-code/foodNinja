import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/success_widget.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessPage(
        title: 'Password reset succesful',
        buttonTitle: 'Back',
        onPressed: () {
          Navigator.of(context).popUntil(
            ModalRoute.withName('/login'),
          );
        },
      ),
    );
  }
}
