import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageHelper {
  static late FlutterSecureStorage appSecureStorage;
  static const String _isFreshInstallKey = 'is_fresh_install';

  static Future<void> init() async {
    appSecureStorage = const FlutterSecureStorage();
    await _clearOnReinstall();
  }

  static Future<void> _clearOnReinstall() async {
    final prefs = await SharedPreferences.getInstance();
    final isFreshInstall = prefs.getBool(_isFreshInstallKey) ?? true;

    if (isFreshInstall) {
      await clearData();
      await prefs.setBool(_isFreshInstallKey, false);
    }
  }

  static put({required String key, required dynamic value}) async {
    return await appSecureStorage.write(key: key, value: value);
  }

  static Future<String?> getData({required String key}) {
    return appSecureStorage.read(key: key);
  }

  static removeData({required key}) async {
    return await appSecureStorage.delete(key: key);
  }

  static clearData() async {
    return await appSecureStorage.deleteAll();
  }
}