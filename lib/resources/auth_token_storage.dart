import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenStorage {
  static AuthTokenStorage _authTokenStorage;

  Future _prefFuture;
  SharedPreferences _preferences;

  factory AuthTokenStorage() {
    if (_authTokenStorage == null) {
      _authTokenStorage = AuthTokenStorage._();
    }
    return _authTokenStorage;
  }

  AuthTokenStorage._() {
    _prefFuture = SharedPreferences.getInstance().then((p) {
      _preferences = p;
    });
  }

  Future<String> getAuthToken({allowStinky = false}) async {
    if (_preferences == null) await _prefFuture;
    if (_preferences.getKeys().contains("token")) {
      return _preferences.getString("token");
    }
    return null;
  }

  Future<void> setAuthToken(String token) async {
    if (_preferences == null) await _prefFuture;
    _preferences.setString("token", token);
  }

  clearToken() {
    _preferences.remove("token");
  }
}

class TokenStinksException {
  final String token;

  TokenStinksException(this.token);
}
