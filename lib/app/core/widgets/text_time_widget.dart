import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodninja/app/core/mixin/format_in_two_digit_mixin.dart';
import 'package:foodninja/app/core/utils/unit.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';

class TextTimeWidget extends StatefulWidget {
  final String text;
  final DateTime dateTime;

  const TextTimeWidget({
    super.key,
    required this.text,
    required this.dateTime,
  });

  @override
  State<TextTimeWidget> createState() => _TextTimeWidgetState();
}

class _TextTimeWidgetState extends State<TextTimeWidget>
    with FormatInTwoDigitMixin {
  @override
  void initState() {
    super.initState();
    currentDateTime = widget.dateTime;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setCurrentDuration();
    });
  }

  late DateTime currentDateTime;
  late final Timer timer;

  String _formatTime(DateTime dateTime) {
    final dateTimeFormated =
        "${formatIntTwoDigitString(dateTime.minute.remainder(60))}:${formatIntTwoDigitString(dateTime.second.remainder(60))}";

    return dateTimeFormated;
  }

  Unit setCurrentDuration() {
    final dateSubtracted = currentDateTime.subtract(
      const Duration(seconds: 1),
    );

    // if (mounted) {
    setState(() {
      currentDateTime = dateSubtracted;
    });
    // }

    if (currentDateTime.minute <= 0 && currentDateTime.second <= 0) {
      timer.cancel();
    }

    return unit;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextWidget.inter(
      '${widget.text}${_formatTime(currentDateTime)}',
      isTextAnimated: false,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.black,
        fontSize: 13,
      ),
    );
  }
}
