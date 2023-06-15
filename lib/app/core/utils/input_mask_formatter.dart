import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMaskFormatter {
  static TextInputFormatter phone() {
    return MaskTextInputFormatter(
      mask: '(##) ###-###-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }
}
