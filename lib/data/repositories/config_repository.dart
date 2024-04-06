import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';

abstract class Config {
  static final I = ConfigRepositorySharedPreferences();

  String? get(String key);
  Future<void> save(String key, String value);
  User? getCurrentUser();
}

late final SharedPreferences prefs;

class ConfigRepositorySharedPreferences implements Config {
  static Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  String? get(String key) => prefs.getString(key);

  @override
  Future<void> save(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  User? getCurrentUser() {
    String? userJson = get('user');
    if (userJson == null) return null;

    return User.fromJson(userJson);
  }
}
