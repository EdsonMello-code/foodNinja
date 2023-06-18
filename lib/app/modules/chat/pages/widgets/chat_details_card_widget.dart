import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class ChatCardDetailsWidget extends StatelessWidget {
  final VoidCallback? onCallTap;
  final String imageUrl;
  final String name;
  final bool isOnline;

  const ChatCardDetailsWidget({
    super.key,
    this.onCallTap,
    required this.imageUrl,
    required this.name,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return Container(
      height: 93,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.asset(imageUrl),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextWidget.inter(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isOnline
                                  ? LinearGradient(
                                      colors: [
                                        context.appTheme.darkGreen,
                                        context.appTheme.green,
                                      ],
                                    )
                                  : const LinearGradient(
                                      colors: [
                                        Colors.redAccent,
                                        Colors.red,
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Visibility(
                            key: UniqueKey(),
                            visible: isOnline,
                            replacement: TextWidget.inter(
                              'Offline',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                            child: TextWidget.inter(
                              'Online',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: onCallTap,
                child: Ink(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeData.brightness == Brightness.light
                        ? const Color(0xFFEDFCF3)
                        : const Color(0xFFF6F6F6).withOpacity(.1),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/call.svg',
                      color: themeData.brightness == Brightness.dark
                          ? const Color(0xFFF6F6F6)
                          : context.appTheme.darkGreen,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
