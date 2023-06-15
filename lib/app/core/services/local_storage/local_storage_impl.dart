import 'dart:io';

import 'package:foodninja/app/core/services/local_storage/local_storage.dart';
import 'package:foodninja/app/core/services/local_storage/local_storage_exception.dart';
import 'package:foodninja/app/core/utils/unit.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageImpl implements LocalStorage {
  final String databaseName;

  const LocalStorageImpl(this.databaseName);

  static Future<Unit> initicialization() async {
    //Todo -> implementar inicializacao no IOS
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      Hive.init(dir.path);
    }

    return unit;
  }

  @override
  Future<dynamic> get(String key) async {
    try {
      final box = await Hive.openBox(databaseName);
      final image = box.get(key);
      return image;
    } on HiveError catch (error, stackTrace) {
      throw LocalStorageException(
        error.message,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Unit> set(
    String key, {
    dynamic data,
  }) async {
    try {
      final box = await Hive.openBox(databaseName);
      await box.put(key, data);
      return unit;
    } on HiveError catch (error, stackTrace) {
      throw LocalStorageException(
        error.message,
        stackTrace: stackTrace,
      );
    }
  }
}
