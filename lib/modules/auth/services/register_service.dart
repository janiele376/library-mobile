
import '../../../core/services/http/api_client.dart';
import '../models/register_request.dart';

class RegisterService {
  RegisterService._();

  static Future<void> register(RegisterRequest request) async {
    final response = await ApiClient.post(
      '/auth/register',
      body: request.toJson(),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      return;
    }

    if (response.statusCode == 400) {
      throw Exception(
        'Dados inválidos. Verifique as informações.',
      );
    }

    if (response.statusCode == 409) {
      throw Exception(
        'E-mail ou CPF já cadastrado.',
      );
    }

    throw Exception(
      'Erro ao realizar cadastro (${response.statusCode}).',
    );
  }
}
