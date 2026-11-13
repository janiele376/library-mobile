
import 'dart:convert';

import '../../../core/services/http/api_client.dart';
import '../../../core/services/storage/token_storage.dart';

class LoginService {
  LoginService._();

  static Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      '/auth/login',
      body: {
        'email': email.trim().toLowerCase(),
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data is Map<String, dynamic> &&
          data['token'] is String &&
          (data['token'] as String).isNotEmpty) {
        final token = data['token'] as String;

        await TokenStorage.saveToken(token);

        return token;
      }

      throw Exception('Token não encontrado na resposta do servidor.');
    }

    if (response.statusCode == 401 ||
        response.statusCode == 403) {
      throw Exception('E-mail ou senha inválidos.');
    }

    throw Exception(
      'Erro ao realizar login (${response.statusCode}).',
    );
  }
}
