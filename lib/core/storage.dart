import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _singleton = StorageService._internal();

  final String _keyThemeData = 'keyThemData';
  final String _keyEmail = 'keyEmail';
  final String _keyPassword = '_keyPassword';

  Future<void> setEmailAndPasswordToSP({
    required String email,
    required String password,
  }) async {
    final SharedPreferences bagettAppSP = await SharedPreferences.getInstance();
    await bagettAppSP.setString(_keyEmail, email);
    await bagettAppSP.setString(_keyPassword, password);
  }

  Future<Map> getEmailAndPasswordToSP() async {
    final SharedPreferences bagettAppSP = await SharedPreferences.getInstance();
    final String? email = bagettAppSP.getString(_keyEmail);
    final String? password = bagettAppSP.getString(_keyPassword);
    final Map<String, String?> emailAndPassword = {
      'email': email,
      'password': password,
    };
    return emailAndPassword;
  }

  Future<void> setThemeDataToSP() async {}

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal() {
    print('object');
  }
}
