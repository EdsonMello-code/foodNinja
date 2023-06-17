import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';

class TextChatTextFieldWidget extends StatelessWidget {
  const TextChatTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: TextFieldWidget(
        height: 74,
        boxShadow: const [],
        suffix: Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: GestureDetector(
            child: Ink(
              color: context.appTheme.green,
              child: SvgPicture.asset('assets/images/send.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
