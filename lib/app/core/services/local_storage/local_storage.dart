import 'package:foodninja/app/core/utils/unit.dart';

abstract interface class LocalStorage {
  Future<dynamic> get(String key);
  Future<Unit> set(String key, {dynamic data});
}
