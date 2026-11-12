
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../storage/token_storage.dart';
import 'api_config.dart';

class ApiClient {
  ApiClient._();

  static final http.Client _client = http.Client();

  // Monta os cabeçalhos da requisição.
  static Future<Map<String, String>> _buildHeaders({
    Map<String, String>? headers,
    bool authenticated = false,
    bool hasBody = false,
  }) async {
    final requestHeaders = <String, String>{
      'Accept': 'application/json',
      if (hasBody) 'Content-Type': 'application/json',
    };

    if (authenticated) {
      final token = await TokenStorage.getToken();

      if (token == null || token.isEmpty) {
        throw StateError('Usuário não autenticado.');
      }

      requestHeaders['Authorization'] = 'Bearer $token';
    }

    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    return requestHeaders;
  }

  // GET - Consultar informações.
  static Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    bool authenticated = false,
  }) async {
    return _client.get(
      Uri.parse('${ApiConfig.baseUrl}$endpoint'),
      headers: await _buildHeaders(
        headers: headers,
        authenticated: authenticated,
      ),
    ).timeout(const Duration(seconds: 10));
  }

  // POST - Enviar informações.
  static Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool authenticated = false,
  }) async {
    return _client.post(
      Uri.parse('${ApiConfig.baseUrl}$endpoint'),
      headers: await _buildHeaders(
        headers: headers,
        authenticated: authenticated,
        hasBody: true,
      ),
      body: jsonEncode(body ?? {}),
    ).timeout(const Duration(seconds: 10));
  }

  // PUT - Atualizar informações.
  static Future<http.Response> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool authenticated = false,
  }) async {
    return _client.put(
      Uri.parse('${ApiConfig.baseUrl}$endpoint'),
      headers: await _buildHeaders(
        headers: headers,
        authenticated: authenticated,
        hasBody: true,
      ),
      body: jsonEncode(body ?? {}),
    ).timeout(const Duration(seconds: 10));
  }

  // DELETE - Excluir informações.
  static Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
    bool authenticated = false,
  }) async {
    return _client.delete(
      Uri.parse('${ApiConfig.baseUrl}$endpoint'),
      headers: await _buildHeaders(
        headers: headers,
        authenticated: authenticated,
      ),
    ).timeout(const Duration(seconds: 10));
  }
}
