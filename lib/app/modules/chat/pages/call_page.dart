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
    final themeData = Theme.of(context);

    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: size.height - padding.top,
          maxWidth: size.width,
        ),
        decoration: BoxDecoration(
          // color: context.appTheme.white,
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: themeData.brightness == Brightness.light
                ? const AssetImage(
                    'assets/images/splash_background.png',
                  )
                : const AssetImage(
                    'assets/images/background_splash_dark.png',
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
                        color: themeData.brightness == Brightness.light
                            ? const Color(0xFF3B3B3B).withOpacity(.3)
                            : Colors.white,
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
                        gradient: themeData.brightness == Brightness.light
                            ? LinearGradient(
                                colors: [
                                  context.appTheme.darkGreen.withOpacity(.3),
                                  context.appTheme.green.withOpacity(.3),
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  context.appTheme.darkGreen.withOpacity(.1),
                                  context.appTheme.green.withOpacity(.1),
                                ],
                              ),
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/images/volume.svg'),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(100),
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
