import 'package:flutter/material.dart';
import 'package:foodninja/app/core/services/image/image_service.dart';
import 'package:foodninja/app/core/services/image/image_service_impl.dart';
import 'package:foodninja/app/core/services/local_storage/local_storage.dart';
import 'package:foodninja/app/core/services/local_storage/local_storage_impl.dart';
import 'package:foodninja/app/core/services/location/location_service.dart';
import 'package:foodninja/app/core/services/location/location_service_impl.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/set_location_controller.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/upload_image_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageImpl.initicialization();
  setup();
  runApp(const AppWidget());
}

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<UploadImageController>(
    UploadImageController(),
  );

  getIt.registerSingleton<ImagePicker>(
    ImagePicker(),
  );
  getIt.registerSingleton<ImageService>(ImageServiceImpl(
    imagePicker: getIt.get<ImagePicker>(),
  ));

  getIt.registerSingleton<LocationService>(
    LocationServiceImpl(),
  );

  getIt.registerSingleton<LocalStorage>(
    const LocalStorageImpl('database'),
  );

  getIt.registerSingleton<SetLocationController>(
    SetLocationController(
      localStorage: getIt.get<LocalStorage>(),
      locationService: getIt.get<LocationService>(),
    ),
  );
}
