
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  TokenStorage._();

  static const FlutterSecureStorage _storage =
      FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';

  // Salvar o token JWT.
  static Future<void> saveToken(String token) async {
    await _storage.write(
      key: _tokenKey,
      value: token,
    );
  }

  // Recuperar o token JWT.
  static Future<String?> getToken() async {
    return _storage.read(
      key: _tokenKey,
    );
  }

  // Remover o token ao sair da conta.
  static Future<void> deleteToken() async {
    await _storage.delete(
      key: _tokenKey,
    );
  }
}
