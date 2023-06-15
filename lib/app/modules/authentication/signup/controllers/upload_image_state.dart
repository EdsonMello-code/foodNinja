import 'dart:io';

sealed class UploadImageState {}

class UploadImageStatePickerImage implements UploadImageState {}

class UploadImageStateImagePicked implements UploadImageState {
  final File file;

  const UploadImageStateImagePicked(this.file);
}
