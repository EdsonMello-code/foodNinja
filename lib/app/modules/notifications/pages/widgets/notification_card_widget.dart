import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title;
  final String time;

  final NoticationEnum status;

  const NotificationCardWidget({
    super.key,
    required this.status,
    required this.title,
    required this.time,
  });
  Widget switchWidgetByStatus(NoticationEnum status) {
    return switch (status) {
      NoticationEnum.payment => SvgPicture.asset(
          'assets/images/in_payment.svg',
        ),
      NoticationEnum.success => SvgPicture.asset(
          'assets/images/notification_succes.svg',
        ),
      NoticationEnum.failure => SvgPicture.asset(
          'assets/images/canceled.svg',
        ),
      _ => SvgPicture.asset(
          'assets/images/canceled.svg',
        )
    };
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.appTheme.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: themeData.brightness == Brightness.light
              ? [
                  const BoxShadow(
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
        ),
        width: size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 21.0,
              ),
              child: SizedBox(
                height: 54,
                width: 54,
                child: switchWidgetByStatus(status),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SizedBox(
                    width: 234,
                    child: TextWidget.inter(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 234,
                  child: TextWidget.inter(
                    time,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: themeData.brightness == Brightness.dark
                          ? Colors.white.withOpacity(.3)
                          : const Color(0xFF3B3B3B).withOpacity(.3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum NoticationEnum {
  success,
  payment,
  failure,
}
