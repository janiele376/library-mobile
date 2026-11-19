
import 'dart:convert';

import '../../../../../core/services/http/api_client.dart';
import '../models/user_model.dart';

class UserPage {
  final List<UserModel> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int size;

  const UserPage({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.size,
  });

  factory UserPage.fromJson(Map<String, dynamic> json) {
    return UserPage(
      content: (json['content'] as List<dynamic>? ?? [])
          .map(
            (item) => UserModel.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalElements: json['totalElements'] ?? 0,
      totalPages: json['totalPages'] ?? 1,
      currentPage: json['number'] ?? 0,
      size: json['size'] ?? 5,
    );
  }
}

class UserService {
  UserService._();

  static const String _endpoint = '/users';

  static Future<UserPage> getUsers({
    String? nameCompleted,
    int page = 0,
    int size = 5,
  }) async {
    final queryParameters = <String, String>{
      'page': page.toString(),
      'size': size.toString(),
    };

    if (nameCompleted != null && nameCompleted.trim().isNotEmpty) {
      queryParameters['nameCompleted'] = nameCompleted.trim();
    }

    final uri = Uri(
      path: _endpoint,
      queryParameters: queryParameters,
    );

    final response = await ApiClient.get(
      uri.toString(),
      authenticated: true,
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível carregar os usuários.');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    return UserPage.fromJson(data);
  }

  static Future<UserModel> getUserById(int id) async {
    final response = await ApiClient.get(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível carregar o usuário.');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    return UserModel.fromJson(data);
  }

  static Future<UserModel> updateUser(UserModel user) async {
    final response = await ApiClient.put(
      '$_endpoint/${user.id}',
      authenticated: true,
      body: {
        'nameCompleted': user.nameCompleted,
        'email': user.email,
        'phone': user.phone,
        'cpf': user.cpf,
        'dateBirth': user.dateBirth,
        'address': user.address,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível atualizar o usuário.');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    return UserModel.fromJson(data);
  }

  static Future<void> deleteUser(int id) async {
    final response = await ApiClient.delete(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Não foi possível excluir o usuário.');
    }
  }
}
