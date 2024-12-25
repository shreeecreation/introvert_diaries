import 'package:introvertdiaries/src/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  const Storage._();

  static Box<String> get _box => Hive.box<String>(StorageKeys.cacheBox);

  static Future<String?> read(String key) async {
    return _box.get(key);
  }

  static Future<void> write({required String key, required String value}) async {
    return _box.put(key, value);
  }

  static Future<void> delete(String key) async {
    return _box.delete(key);
  }
}
