mixin FormatInTwoDigitMixin {
  String formatIntTwoDigitString(int value) {
    if (value >= 10) {
      return value.toString();
    }

    return '0$value';
  }
}
