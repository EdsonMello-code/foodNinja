import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final String url;
  final String time;

  const HomeCardWidget({
    super.key,
    required this.title,
    required this.url,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {},
      child: Ink(
        height: 184,
        width: 147,
        padding: const EdgeInsets.only(
          bottom: 26,
          top: 8,
        ),
        decoration: BoxDecoration(
          color: context.appTheme.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
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
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              url,
            ),
            TextWidget.inter(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextWidget.inter(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
