import 'dart:io';

import 'package:foodninja/app/core/services/image/image_service.dart';
import 'package:image_picker/image_picker.dart';

import 'image_exception.dart';

class ImageServiceImpl implements ImageService {
  final ImagePicker imagePicker;

  const ImageServiceImpl({
    required this.imagePicker,
  });

  @override
  Future<File> pickerImageFromGallery() async {
    try {
      final imageAsXFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (imageAsXFile == null) {
        throw const ImageException(
          'Imagem nao selecionada!',
        );
      }

      final imageAsFile = File(imageAsXFile.path);

      return imageAsFile;
    } on ArgumentError catch (error, stackTrace) {
      throw ImageException(
        error.message,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<File> pickerImageFromCamera() async {
    try {
      final imageAsXFile = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (imageAsXFile == null) {
        throw const ImageException(
          'Imagem nao selecionada!',
        );
      }

      final imageAsFile = File(imageAsXFile.path);

      return imageAsFile;
    } on ArgumentError catch (error, stackTrace) {
      throw ImageException(
        error.message,
        stackTrace: stackTrace,
      );
    }
  }
}
