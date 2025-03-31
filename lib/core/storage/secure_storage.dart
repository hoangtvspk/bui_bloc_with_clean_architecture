import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;
  final FlutterSecureStorage _storage;

  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String userEmailKey = 'user_email';

  // Private constructor
  SecureStorage._internal() : _storage = const FlutterSecureStorage();

  // Factory constructor
  factory SecureStorage() {
    _instance ??= SecureStorage._internal();
    return _instance!;
  }

  // Auth related methods
  Future<void> writeAccessToken(String token) async {
    await _storage.write(key: accessTokenKey, value: token);
  }

  Future<void> writeRefreshToken(String token) async {
    await _storage.write(key: refreshTokenKey, value: token);
  }

  Future<String?> readAccessToken() async {
    return await _storage.read(key: accessTokenKey);
  }

  Future<String?> readRefreshToken() async {
    return await _storage.read(key: refreshTokenKey);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: accessTokenKey);
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: refreshTokenKey);
  }

  // User related methods
  Future<void> writeUserId(String userId) async {
    await _storage.write(key: userIdKey, value: userId);
  }

  Future<void> writeUserEmail(String email) async {
    await _storage.write(key: userEmailKey, value: email);
  }

  Future<String?> readUserId() async {
    return await _storage.read(key: userIdKey);
  }

  Future<String?> readUserEmail() async {
    return await _storage.read(key: userEmailKey);
  }

  // General methods
  Future<void> deleteKey(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<bool> hasKey(String key) async {
    return (await _storage.read(key: key)) != null;
  }
}
