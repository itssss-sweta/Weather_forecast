import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  CacheServices._();
  static final CacheServices _cacheServices = CacheServices._();

  factory CacheServices() => _cacheServices;

  static CacheServices getCacheServicesInstance = _cacheServices;

  static late SharedPreferences sharedPreferences;

  /// Initializes the cache services.
  static Future<void> initializeCache() async {
    await CacheServices.getCacheServicesInstance.initPreferences();
  }

  /// Initialize SharedPreferences instance.
  Future<SharedPreferences> initPreferences() async =>
      sharedPreferences = await SharedPreferences.getInstance();
}
