import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/upload_image_state.dart';

class UploadImageController extends ValueNotifier<UploadImageState> {
  UploadImageController() : super(UploadImageStatePickerImage());

  emit(UploadImageState state) {
    value = state;
  }

  Future<void> loadImage(File image) async {
    emit(
      UploadImageStateImagePicked(image),
    );
  }

  Future<void> removeImage() async {
    emit(
      UploadImageStatePickerImage(),
    );
  }
}
