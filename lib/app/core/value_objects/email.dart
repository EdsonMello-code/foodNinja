class Email {
  final String value;
  const Email(this.value);

  RegExp get _regex => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool get isValid => _regex.hasMatch(value);
}
