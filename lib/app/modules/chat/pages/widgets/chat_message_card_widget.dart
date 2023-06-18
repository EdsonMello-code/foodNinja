import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/mixin/format_in_two_digit_mixin.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/chat/models/chat_message_model.dart';

class ChatCardMessageWidget extends StatelessWidget with FormatInTwoDigitMixin {
  final VoidCallback? onTap;

  final ChatMessageModel chatModel;

  const ChatCardMessageWidget({
    super.key,
    required this.chatModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Ink(
        height: 81,
        width: size.width,
        decoration: BoxDecoration(
          color: context.appTheme.white,
          boxShadow: themeData.brightness == Brightness.light
              ? const [
                  BoxShadow(
                    color: Color.fromARGB(
                      20,
                      90,
                      108,
                      234,
                    ),
                    blurRadius: 50,
                    offset: Offset(12.0, 26.0),
                  ),
                ]
              : [],
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  chatModel.imageUrl,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextWidget.inter(
                      chatModel.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextWidget.inter(
                    chatModel.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextWidget.inter(
                  '${formatIntTwoDigitString(chatModel.updateAt.hour)}:${formatIntTwoDigitString(chatModel.updateAt.minute)}',
                  style: const TextStyle(
                    color: Color(0xFFD9D9D9),
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
