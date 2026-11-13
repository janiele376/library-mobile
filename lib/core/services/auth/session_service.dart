
import 'dart:convert';

import '../storage/token_storage.dart';

class SessionService {
  SessionService._();

  // Recuperar os dados do JWT.
  static Future<Map<String, dynamic>?> getTokenPayload() async {
    final token = await TokenStorage.getToken();

    if (token == null || token.isEmpty) {
      return null;
    }

    try {
      final parts = token.split('.');

      if (parts.length != 3) {
        await TokenStorage.deleteToken();
        return null;
      }

      final decoded = utf8.decode(
        base64Url.decode(
          base64Url.normalize(parts[1]),
        ),
      );

      final data = jsonDecode(decoded);

      if (data is! Map<String, dynamic>) {
        await TokenStorage.deleteToken();
        return null;
      }

      // Verificar a expiração.
      final expiration = data['exp'];

      if (expiration is! num) {
        await TokenStorage.deleteToken();
        return null;
      }

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(
        expiration.toInt() * 1000,
        isUtc: true,
      );

      if (!DateTime.now().toUtc().isBefore(expirationDate)) {
        await TokenStorage.deleteToken();
        return null;
      }

      return data;
    } catch (_) {
      await TokenStorage.deleteToken();
      return null;
    }
  }

  // Verificar se existe uma sessão não expirada.
  static Future<bool> isAuthenticated() async {
    final payload = await getTokenPayload();
    return payload != null;
  }

  // Identificar se o usuário é administrador.
  static Future<bool> isAdmin() async {
    final payload = await getTokenPayload();

    if (payload == null) {
      return false;
    }

    return payload['isAdmin'] == true;
  }

  // Encerrar a sessão.
  static Future<void> logout() async {
    await TokenStorage.deleteToken();
  }
}
