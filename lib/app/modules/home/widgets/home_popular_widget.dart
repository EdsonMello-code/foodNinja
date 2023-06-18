import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class HomePopularWidget extends StatelessWidget {
  const HomePopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(22),
      child: Ink(
        height: 87,
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
          padding: const EdgeInsets.only(right: 19.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 21.0,
                      left: 10,
                    ),
                    child: Image.asset('assets/images/menu.png'),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextWidget.inter(
                          'Green Noddle',
                          isTextAnimated: false,
                          style: TextStyle(
                            color: context.appTheme.black,
                          ),
                        ),
                      ),
                      TextWidget.inter(
                        'Noodle Home',
                        isTextAnimated: false,
                        style: TextStyle(
                          color: context.appTheme.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextWidget.inter(
                r'$15',
                style: const TextStyle(
                  color: Color(0xFFFEAD1D),
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
