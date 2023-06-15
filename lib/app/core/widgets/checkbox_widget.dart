import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/types/on_changed_type.dart';

class CheckBoxWidget extends StatefulWidget {
  final bool initialValue;

  final OnChanged<bool> onChanged;

  const CheckBoxWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  late bool currentValue;

  @override
  void initState() {
    super.initState();

    currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(currentValue);
        setState(() {
          currentValue = !currentValue;
        });
      },
      child: Ink(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: currentValue
              ? null
              : Border.all(
                  color: context.appTheme.darkGreen,
                ),
          gradient: currentValue
              ? LinearGradient(
                  colors: [
                    context.appTheme.darkGreen,
                    context.appTheme.green,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                    0.3,
                    0.8,
                  ],
                )
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/check.svg',
            height: 12,
            width: 12,
          ),
        ),
      ),
    );
  }
}
