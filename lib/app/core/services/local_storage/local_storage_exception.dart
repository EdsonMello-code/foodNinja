import 'package:foodninja/app/core/errors/app_exception.dart';

class LocalStorageException implements AppException {
  @override
  final String message;

  @override
  final StackTrace? stackTrace;

  const LocalStorageException(this.message, {this.stackTrace});
}
