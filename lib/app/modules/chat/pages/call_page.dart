import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/chat/models/chat_message_model.dart';

class CallPage extends StatelessWidget {
  final ChatMessageModel chat;

  const CallPage({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: size.height - padding.top,
          maxWidth: size.width,
        ),
        decoration: BoxDecoration(
          color: context.appTheme.white,
          image: const DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(
              'assets/images/splash_background.png',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        padding: padding.copyWith(
          left: padding.left + 25,
          right: padding.right + 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        context.appTheme.darkGreen,
                        context.appTheme.green,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 161,
                        height: 161,
                        child: Image.asset(
                          chat.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 58),
                      child: TextWidget.inter(
                        chat.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextWidget.inter(
                      'Ringing . . .',
                      style: TextStyle(
                        fontSize: 19,
                        color: const Color(0xFF3B3B3B).withOpacity(.3),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 78,
                      width: 78,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            context.appTheme.darkGreen.withOpacity(.3),
                            context.appTheme.green.withOpacity(.3),
                          ],
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/images/volume.svg'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                      child: Ink(
                        height: 78,
                        width: 78,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF4B4B),
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/images/close.svg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
