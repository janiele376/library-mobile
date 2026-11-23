
import 'dart:convert';

import '../../../../../core/services/http/api_client.dart';
import '../models/book_model.dart';
import '../models/book_update_model.dart';

class BookPage {
  final List<BookModel> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int size;

  const BookPage({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.size,
  });

  factory BookPage.fromJson(Map<String, dynamic> json) {
    return BookPage(
      content: (json['content'] as List)
          .map(
            (item) => BookModel.fromJson(
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

class BookService {
  static const String _endpoint = '/books';

  Future<BookPage> getBooks({
    String? title,
    String? genre,
    String? isbn,
    int page = 0,
    int size = 5,
  }) async {
    final queryParameters = <String, String>{
      'page': page.toString(),
      'size': size.toString(),
      if (title != null && title.trim().isNotEmpty)
        'title': title.trim(),
      if (genre != null && genre.trim().isNotEmpty)
        'genre': genre.trim(),
      if (isbn != null && isbn.trim().isNotEmpty)
        'isbn': isbn.trim(),
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
      return BookPage.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao buscar livros: ${response.body}',
    );
  }

  Future<BookModel> getBookById(int id) async {
    final response = await ApiClient.get(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return BookModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao buscar livro: ${response.body}',
    );
  }

  Future<BookModel> createBook({
    required String isbn,
    required String title,
    required String genre,
    required String releaseDate,
    required int publisherId,
    required int quantity,
  }) async {
    final response = await ApiClient.post(
      _endpoint,
      body: {
        'isbn': isbn,
        'title': title,
        'genre': genre,
        'releaseDate': releaseDate,
        'publisherId': publisherId,
        'quantity': quantity,
      },
      authenticated: true,
    );

    if (response.statusCode == 201) {
      return BookModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao cadastrar livro: ${response.body}',
    );
  }

  Future<BookUpdateModel> updateBook({
    required int id,
    required String title,
    required String genre,
    required String releaseDate,
    required int publisherId,
    required int quantity,
  }) async {
    final response = await ApiClient.put(
      '$_endpoint/$id',
      body: {
        'title': title,
        'genre': genre,
        'releaseDate': releaseDate,
        'publisherId': publisherId,
        'quantity': quantity,
      },
      authenticated: true,
    );

    if (response.statusCode == 200) {
      return BookUpdateModel.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Erro ao atualizar livro: ${response.body}',
    );
  }

  Future<void> deleteBook(int id) async {
    final response = await ApiClient.delete(
      '$_endpoint/$id',
      authenticated: true,
    );

    if (response.statusCode != 204) {
      throw Exception(
        'Erro ao excluir livro: ${response.body}',
      );
    }
  }
}
