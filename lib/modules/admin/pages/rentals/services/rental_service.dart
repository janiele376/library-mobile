
import 'dart:convert';

import '../../../../../core/services/http/api_client.dart';
import '../models/rental_model.dart';

class RentalPage {
  final List<RentalModel> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int size;

  const RentalPage({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.size,
  });

  factory RentalPage.fromJson(Map<String, dynamic> json) {
    return RentalPage(
      content: (json['content'] as List)
          .map(
            (item) => RentalModel.fromJson(
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

class RentalService {
  static const String _endpoint = '/rentals';

  Future<RentalPage> getRentals({
    String? userName,
    String? bookTitle,
    int page = 0,
    int size = 5,
  }) async {
    final queryParameters = <String, String>{
      'page': page.toString(),
      'size': size.toString(),
      if (userName != null && userName.trim().isNotEmpty)
        'userName': userName.trim(),
      if (bookTitle != null && bookTitle.trim().isNotEmpty)
        'bookTitle': bookTitle.trim(),
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
      return RentalPage.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao buscar aluguéis: ${response.body}',
    );
  }

  Future<RentalModel> getRentalById(int id) async {
    final response = await ApiClient.get(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return RentalModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao buscar aluguel: ${response.body}',
    );
  }

  Future<RentalModel> createRental({
    required int usersId,
    required int booksId,
  }) async {
    final response = await ApiClient.post(
      _endpoint,
      body: {
        'usersId': usersId,
        'booksId': booksId,
      },
      authenticated: true,
    );

    if (response.statusCode == 201) {
      return RentalModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao cadastrar aluguel: ${response.body}',
    );
  }

  Future<RentalModel> updateRental({
    required int id,
    int? usersId,
    int? booksId,
  }) async {
    final response = await ApiClient.patch(
      '$_endpoint/$id',
      body: {
        if (usersId != null) 'usersId': usersId,
        if (booksId != null) 'booksId': booksId,
      },
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return RentalModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao atualizar aluguel: ${response.body}',
    );
  }

  Future<RentalModel> renewRental(int id) async {
    final response = await ApiClient.put(
      '$_endpoint/$id/renew',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return RentalModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao renovar aluguel: ${response.body}',
    );
  }

  Future<RentalModel> returnRental(int id) async {
    final response = await ApiClient.put(
      '$_endpoint/$id/return',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return RentalModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao devolver livro: ${response.body}',
    );
  }

  Future<void> deleteRental(int id) async {
    final response = await ApiClient.delete(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode != 204) {
      throw Exception(
        'Erro ao excluir aluguel: ${response.body}',
      );
    }
  }
}
