import 'dart:io';

abstract interface class ImageService {
  Future<File> pickerImageFromGallery();
  Future<File> pickerImageFromCamera();
}
