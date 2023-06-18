import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatMessageWidget({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: isMe ? Alignment.topLeft : Alignment.topRight,
        child: LayoutBuilder(builder: (context, boxConstraints) {
          return Container(
            padding: const EdgeInsets.all(12),
            constraints: boxConstraints.maxWidth >= size.width * .7
                ? BoxConstraints(
                    maxWidth: size.width * .7,
                  )
                : null,
            decoration: BoxDecoration(
              color: isMe
                  ? null
                  : themeData.brightness == Brightness.light
                      ? const Color(0xFFF6F6F6)
                      : Colors.white.withOpacity(.1),
              gradient: isMe
                  ? LinearGradient(
                      colors: [
                        context.appTheme.darkGreen,
                        context.appTheme.green,
                      ],
                    )
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextWidget.inter(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: isMe
                    ? themeData.brightness == Brightness.light
                        ? context.appTheme.white
                        : Colors.white
                    : themeData.brightness == Brightness.light
                        ? null
                        : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
