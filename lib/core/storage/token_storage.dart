import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenStorage {
  Future<String?> readAccessToken();
  Future<String?> readRefreshToken();
  Future<void> saveTokens({required String accessToken, required String refreshToken});
  Future<void> clear();
}

class AppTokenStorage implements TokenStorage {
  AppTokenStorage({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _secureStorage;
  static String? _webAccessToken;
  static String? _webRefreshToken;

  @override
  Future<void> clear() async {
    if (kIsWeb) {
      _webAccessToken = null;
      _webRefreshToken = null;
      return;
    }
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  @override
  Future<String?> readAccessToken() async {
    if (kIsWeb) return _webAccessToken;
    return _secureStorage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> readRefreshToken() async {
    if (kIsWeb) return _webRefreshToken;
    return _secureStorage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    if (kIsWeb) {
      _webAccessToken = accessToken;
      _webRefreshToken = refreshToken;
      return;
    }
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }
}
