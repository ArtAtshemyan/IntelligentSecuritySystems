import 'package:intelligent_security_systems/core/constants/shared_perfereces_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(SharedPreferencesKeys.accessToken);
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
