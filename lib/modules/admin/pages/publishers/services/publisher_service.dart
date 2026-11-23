
import 'dart:convert';

import '../../../../../core/services/http/api_client.dart';
import '../models/publisher_model.dart';
import '../models/publisher_update_model.dart';

class PublisherPage {
  final List<PublisherModel> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int size;

  const PublisherPage({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.size,
  });

  factory PublisherPage.fromJson(Map<String, dynamic> json) {
    return PublisherPage(
      content: (json['content'] as List)
          .map(
            (item) => PublisherModel.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalElements: json['totalElements'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['number'] ?? 0,
      size: json['size'] ?? 5,
    );
  }
}

class PublisherService {
  static const String _endpoint = '/publishers';

  Future<PublisherPage> getPublishers({
    String? name,
    int page = 0,
    int size = 5,
  }) async {
    final queryParameters = <String, String>{
      'page': page.toString(),
      'size': size.toString(),
      if (name != null && name.trim().isNotEmpty)
        'name': name.trim(),
    };

    final uri = Uri(
      path: _endpoint,
      queryParameters: queryParameters,
    );

    final response = await ApiClient.get(
      uri.toString(),
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return PublisherPage.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao buscar editoras: ${response.body}',
    );
  }

  Future<PublisherModel> getPublisherById(int id) async {
    final response = await ApiClient.get(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return PublisherModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao buscar editora: ${response.body}',
    );
  }

  Future<PublisherModel> createPublisher({
    required String name,
    required String cnpj,
    required String email,
    required String phone,
    required String address,
  }) async {
    final response = await ApiClient.post(
      _endpoint,
      body: {
        'name': name,
        'cnpj': cnpj,
        'email': email,
        'phone': phone,
        'address': address,
      },
      authenticated: true,
    );

    if (response.statusCode == 201) {
      return PublisherModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao cadastrar editora: ${response.body}',
    );
  }

  Future<PublisherUpdateModel> updatePublisher({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    final response = await ApiClient.put(
      '$_endpoint/$id',
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      },
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return PublisherUpdateModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao atualizar editora: ${response.body}',
    );
  }

  Future<void> deletePublisher(int id) async {
    final response = await ApiClient.delete(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode != 204) {
      throw Exception(
        'Erro ao excluir editora: ${response.body}',
      );
    }
  }
}
