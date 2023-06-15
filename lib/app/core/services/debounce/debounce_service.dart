import 'dart:async';

import 'package:flutter/foundation.dart';

class DebouncerService {
  final int milliseconds;
  Timer? timer;

  DebouncerService({
    required this.milliseconds,
  });
  call(VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
