
import 'dart:async';

import 'package:flutter/material.dart';

import '../../users/models/user_model.dart';
import '../../users/services/user_service.dart';
import '../../books/models/book_model.dart';
import '../../books/services/book_service.dart';
import '../models/rental_model.dart';
import '../models/rental_update_model.dart';

class RentalEditFormController extends ChangeNotifier {
  final RentalModel rental;

  final TextEditingController userController = TextEditingController();
  final TextEditingController bookController = TextEditingController();

  final BookService _bookService = BookService();

  Timer? _userDebounce;
  Timer? _bookDebounce;

  List<UserModel> userResults = [];
  List<BookModel> bookResults = [];

  int? selectedUserId;
  int? selectedBookId;

  bool isLoadingInitial = true;
  bool isSearchingUsers = false;
  bool isSearchingBooks = false;

  bool searchedUsers = false;
  bool searchedBooks = false;

  String? userError;
  String? bookError;
  String? changeError;

  int _userSearchVersion = 0;
  int _bookSearchVersion = 0;

  bool _disposed = false;

  RentalEditFormController({
    required this.rental,
  }) {
    selectedUserId = rental.usersId;
    selectedBookId = rental.booksId;
  }

  Future<void> loadInitialSelections() async {
    await Future.wait([
      _loadInitialUser(),
      _loadInitialBook(),
    ]);

    if (_disposed) return;

    isLoadingInitial = false;
    notifyListeners();
  }

  Future<void> _loadInitialUser() async {
    try {
      final user = await UserService.getUserById(
        rental.usersId,
      );

      if (_disposed) return;

      userController.text = user.nameCompleted;
    } catch (_) {
      if (_disposed) return;

      userError = 'Não foi possível carregar o usuário atual.';
    }
  }

  Future<void> _loadInitialBook() async {
    try {
      final book = await _bookService.getBookById(
        rental.booksId,
      );

      if (_disposed) return;

      bookController.text = book.title;
    } catch (_) {
      if (_disposed) return;

      bookError = 'Não foi possível carregar o livro atual.';
    }
  }

  void searchUsers(String query) {
    _userDebounce?.cancel();

    final version = ++_userSearchVersion;

    selectedUserId = null;
    userResults = [];
    userError = null;
    changeError = null;
    searchedUsers = false;
    isSearchingUsers = false;

    notifyListeners();

    final searchQuery = query.trim();

    if (searchQuery.length < 2) return;

    _userDebounce = Timer(
      const Duration(milliseconds: 350),
      () async {
        if (_disposed || version != _userSearchVersion) return;

        isSearchingUsers = true;
        notifyListeners();

        try {
          final page = await UserService.getUsers(
            nameCompleted: searchQuery,
            page: 0,
            size: 10,
          );

          if (_disposed || version != _userSearchVersion) return;

          userResults = page.content;
          isSearchingUsers = false;
          searchedUsers = true;
        } catch (_) {
          if (_disposed || version != _userSearchVersion) return;

          userError = 'Não foi possível pesquisar usuários.';
          isSearchingUsers = false;
        }

        notifyListeners();
      },
    );
  }

  void searchBooks(String query) {
    _bookDebounce?.cancel();

    final version = ++_bookSearchVersion;

    selectedBookId = null;
    bookResults = [];
    bookError = null;
    changeError = null;
    searchedBooks = false;
    isSearchingBooks = false;

    notifyListeners();

    final searchQuery = query.trim();

    if (searchQuery.length < 2) return;

    _bookDebounce = Timer(
      const Duration(milliseconds: 350),
      () async {
        if (_disposed || version != _bookSearchVersion) return;

        isSearchingBooks = true;
        notifyListeners();

        try {
          final page = await _bookService.getBooks(
            title: searchQuery,
            page: 0,
            size: 10,
          );

          if (_disposed || version != _bookSearchVersion) return;

          bookResults = page.content.where((book) {
            return book.quantity > 0 ||
                book.id == rental.booksId;
          }).toList();

          isSearchingBooks = false;
          searchedBooks = true;
        } catch (_) {
          if (_disposed || version != _bookSearchVersion) return;

          bookError = 'Não foi possível pesquisar livros.';
          isSearchingBooks = false;
        }

        notifyListeners();
      },
    );
  }

  void selectUser(UserModel user) {
    _userDebounce?.cancel();
    _userSearchVersion++;

    selectedUserId = user.id;
    userController.text = user.nameCompleted;
    userResults = [];
    userError = null;
    searchedUsers = false;
    isSearchingUsers = false;
    changeError = null;

    notifyListeners();
  }

  void selectBook(BookModel book) {
    _bookDebounce?.cancel();
    _bookSearchVersion++;

    selectedBookId = book.id;
    bookController.text = book.title;
    bookResults = [];
    bookError = null;
    searchedBooks = false;
    isSearchingBooks = false;
    changeError = null;

    notifyListeners();
  }

  RentalUpdateModel? createUpdateModel() {
    final userChanged = selectedUserId != rental.usersId;
    final bookChanged = selectedBookId != rental.booksId;

    if (!userChanged && !bookChanged) {
      changeError = 'Altere pelo menos um campo para salvar.';
      notifyListeners();
      return null;
    }

    return RentalUpdateModel(
      id: rental.id,
      usersId: userChanged ? selectedUserId : null,
      booksId: bookChanged ? selectedBookId : null,
    );
  }

  @override
  void dispose() {
    _disposed = true;

    _userDebounce?.cancel();
    _bookDebounce?.cancel();

    _userSearchVersion++;
    _bookSearchVersion++;

    userController.dispose();
    bookController.dispose();

    super.dispose();
  }
}
