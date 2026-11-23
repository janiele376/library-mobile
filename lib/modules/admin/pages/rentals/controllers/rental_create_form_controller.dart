
import 'dart:async';

import 'package:flutter/material.dart';

import '../../users/models/user_model.dart';
import '../../users/services/user_service.dart';
import '../../books/models/book_model.dart';
import '../../books/services/book_service.dart';

class RentalCreateFormController extends ChangeNotifier {
  final TextEditingController userController = TextEditingController();
  final TextEditingController bookController = TextEditingController();

  final BookService _bookService = BookService();

  Timer? _userDebounce;
  Timer? _bookDebounce;

  List<UserModel> userResults = [];
  List<BookModel> bookResults = [];

  int? selectedUserId;
  int? selectedBookId;

  bool isSearchingUsers = false;
  bool isSearchingBooks = false;

  bool searchedUsers = false;
  bool searchedBooks = false;

  String? userError;
  String? bookError;

  int _userSearchVersion = 0;
  int _bookSearchVersion = 0;

  void searchUsers(String query) {
    _userDebounce?.cancel();

    final version = ++_userSearchVersion;

    selectedUserId = null;
    userResults = [];
    userError = null;
    searchedUsers = false;
    isSearchingUsers = false;

    notifyListeners();

    final searchQuery = query.trim();

    if (searchQuery.length < 2) return;

    _userDebounce = Timer(
      const Duration(milliseconds: 350),
      () async {
        if (version != _userSearchVersion) return;

        isSearchingUsers = true;
        notifyListeners();

        try {
          final page = await UserService.getUsers(
            nameCompleted: searchQuery,
            page: 0,
            size: 10,
          );

          if (version != _userSearchVersion) return;

          userResults = page.content;
          searchedUsers = true;
          isSearchingUsers = false;
          userError = null;
        } catch (_) {
          if (version != _userSearchVersion) return;

          userError = 'Não foi possível pesquisar usuários.';
          isSearchingUsers = false;
          searchedUsers = false;
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
    searchedBooks = false;
    isSearchingBooks = false;

    notifyListeners();

    final searchQuery = query.trim();

    if (searchQuery.length < 2) return;

    _bookDebounce = Timer(
      const Duration(milliseconds: 350),
      () async {
        if (version != _bookSearchVersion) return;

        isSearchingBooks = true;
        notifyListeners();

        try {
          final page = await _bookService.getBooks(
            title: searchQuery,
            page: 0,
            size: 10,
          );

          if (version != _bookSearchVersion) return;

          bookResults = page.content
              .where((book) => book.quantity > 0)
              .toList();

          searchedBooks = true;
          isSearchingBooks = false;
          bookError = null;
        } catch (_) {
          if (version != _bookSearchVersion) return;

          bookError = 'Não foi possível pesquisar livros.';
          isSearchingBooks = false;
          searchedBooks = false;
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

    notifyListeners();
  }

  @override
  void dispose() {
    _userDebounce?.cancel();
    _bookDebounce?.cancel();

    _userSearchVersion++;
    _bookSearchVersion++;

    userController.dispose();
    bookController.dispose();

    super.dispose();
  }
}
