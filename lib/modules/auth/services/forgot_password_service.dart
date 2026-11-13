
import '../../../core/services/http/api_client.dart';
import '../models/forgot_password_request.dart';

class ForgotPasswordService {
  ForgotPasswordService._();

  static Future<void> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    final response = await ApiClient.post(
      '/auth/forgot-password',
      body: request.toJson(),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 204) {
      return;
    }

    if (response.statusCode == 400) {
      throw Exception(
        'Dados inválidos. Verifique as informações.',
      );
    }

    if (response.statusCode == 404) {
      throw Exception(
        'Usuário não encontrado.',
      );
    }

    throw Exception(
      'Erro ao recuperar senha (${response.statusCode}).',
    );
  }
}
