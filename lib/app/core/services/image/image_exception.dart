import 'package:foodninja/app/core/errors/app_exception.dart';

class ImageException implements AppException {
  @override
  final String message;

  @override
  final StackTrace? stackTrace;

  const ImageException(
    this.message, {
    this.stackTrace,
  });
}
