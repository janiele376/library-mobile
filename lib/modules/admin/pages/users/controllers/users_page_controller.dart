
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UsersPageController extends ChangeNotifier {
  List<UserModel> users = [];

  bool isLoading = true;
  bool hasError = false;

  String search = '';
  int currentPage = 1;
  int totalPages = 1;

  static const int pageSize = 5;

  Timer? _searchDebounce;

  Future<void> loadUsers() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final result = await UserService.getUsers(
        nameCompleted: search,
        page: currentPage - 1,
        size: pageSize,
      );

      users = result.content;
      totalPages = result.totalPages < 1 ? 1 : result.totalPages;
      currentPage = result.currentPage + 1;
    } catch (_) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void onSearchChanged(String value) {
    search = value.trim();
    currentPage = 1;

    _searchDebounce?.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: 400),
      loadUsers,
    );
  }

  Future<void> changePage(int page) async {
    if (page < 1 || page > totalPages) return;

    currentPage = page;
    await loadUsers();
  }

  Future<void> updateUser(UserModel user) async {
    await UserService.updateUser(user);
    await loadUsers();
  }

  Future<void> deleteUser(int id) async {
    final shouldGoToPreviousPage = users.length == 1 && currentPage > 1;

    await UserService.deleteUser(id);

    if (shouldGoToPreviousPage) {
      currentPage--;
    }

    await loadUsers();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }
}
