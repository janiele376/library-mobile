
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/book_model.dart';
import '../models/book_update_model.dart';
import '../services/book_service.dart';

class BooksPageController extends ChangeNotifier {
  final BookService _bookService;

  BooksPageController({
    BookService? bookService,
  }) : _bookService = bookService ?? BookService();

  List<BookModel> books = [];

  bool isLoading = true;
  bool hasError = false;

  String searchQuery = '';

  int currentPage = 1;
  int totalPages = 1;

  static const int pageSize = 5;

  Timer? _debounce;

  Future<void> loadBooks() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final result = await _bookService.getBooks(
        title: searchQuery,
        page: currentPage - 1,
        size: pageSize,
      );

      books = result.content;
      totalPages = result.totalPages > 0
          ? result.totalPages
          : 1;
    } catch (_) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void onSearchChanged(String value) {
    searchQuery = value;
    currentPage = 1;

    _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 400),
      loadBooks,
    );

    notifyListeners();
  }

  Future<void> changePage(int page) async {
    if (page < 1 || page > totalPages) return;

    currentPage = page;
    await loadBooks();
  }

  Future<BookModel> createBook({
    required String isbn,
    required String title,
    required String genre,
    required String releaseDate,
    required int publisherId,
    required int quantity,
  }) async {
    final book = await _bookService.createBook(
      isbn: isbn,
      title: title,
      genre: genre,
      releaseDate: releaseDate,
      publisherId: publisherId,
      quantity: quantity,
    );

    currentPage = 1;
    await loadBooks();

    return book;
  }

  Future<BookUpdateModel> updateBook({
    required int id,
    required String title,
    required String genre,
    required String releaseDate,
    required int publisherId,
    required int quantity,
  }) async {
    final book = await _bookService.updateBook(
      id: id,
      title: title,
      genre: genre,
      releaseDate: releaseDate,
      publisherId: publisherId,
      quantity: quantity,
    );

    await loadBooks();

    return book;
  }

  Future<void> deleteBook(int id) async {
    await _bookService.deleteBook(id);

    if (books.length == 1 && currentPage > 1) {
      currentPage--;
    }

    await loadBooks();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
