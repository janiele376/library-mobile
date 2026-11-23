
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/services/auth/session_service.dart';
import '../../../../../../core/services/routes/app_routes.dart';
import '../../../../../../core/widgets/app_header.dart';
import '../../../../../../core/widgets/app_menu.dart';

import '../../../../widgets/admin_list_container.dart';
import '../../../../widgets/admin_navigation_tabs.dart';
import '../../../../widgets/admin_pagination.dart';
import '../../../../widgets/admin_search_bar.dart';

import '../../models/book_model.dart';
import '../../models/book_update_model.dart';
import '../../services/book_service.dart';

import '../widgets/book_list_item.dart';
import '../widgets/book_create_dialog.dart';
import '../widgets/book_edit_dialog.dart';
import '../widgets/book_delete_dialog.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final BookService _bookService = BookService();

  List<BookModel> _books = [];

  bool _isLoading = true;
  String? _errorMessage;

  String _searchQuery = '';

  int _currentPage = 1;
  int _totalPages = 1;

  static const int _pageSize = 5;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _logout() async {
    await SessionService.logout();

    if (!mounted) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.login,
      (route) => false,
    );
  }

  void _openDashboard() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.adminDashboard,
    );
  }

  void _openSettings() {
    Navigator.of(context).pushNamed(
      AppRoutes.settings,
    );
  }

  void _openAdminArea() {}

  Future<void> _loadBooks() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _bookService.getBooks(
        title: _searchQuery.isEmpty ? null : _searchQuery,
        page: _currentPage - 1,
        size: _pageSize,
      );

      if (!mounted) return;

      setState(() {
        _books = result.content;
        _totalPages = result.totalPages < 1
            ? 1
            : result.totalPages;
        _currentPage = result.currentPage + 1;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _errorMessage = AppLocalizations.of(context)!.bookLoadError;
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 400),
      () {
        _searchQuery = value.trim();
        _currentPage = 1;
        _loadBooks();
      },
    );
  }

  void _onPageChanged(int page) {
    if (page < 1 || page > _totalPages) return;

    setState(() {
      _currentPage = page;
    });

    _loadBooks();
  }

  Future<void> _createBook(Map<String, dynamic> data) async {
    try {
      await _bookService.createBook(
        isbn: data['isbn'] as String,
        title: data['title'] as String,
        genre: data['genre'] as String,
        releaseDate: data['releaseDate'] as String,
        publisherId: data['publisherId'] as int,
        quantity: data['quantity'] as int,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.bookCreateSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      _currentPage = 1;
      await _loadBooks();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _updateBook(BookUpdateModel book) async {
    try {
      await _bookService.updateBook(
        id: book.id,
        title: book.title,
        genre: book.genre,
        releaseDate: book.releaseDate,
        publisherId: book.publisherId,
        quantity: book.quantity,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.bookUpdateSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      await _loadBooks();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _deleteBook(BookModel book) async {
    try {
      await _bookService.deleteBook(book.id);

      if (!mounted) return;

      if (_books.length == 1 && _currentPage > 1) {
        _currentPage--;
      }

      await _loadBooks();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.bookDeleteSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _showCreateDialog() {
    BookCreateDialog.show(
      context: context,
      onSave: _createBook,
    );
  }

  void _showEditDialog(BookModel book) {
    BookEditDialog.show(
      context: context,
      book: book,
      onSave: _updateBook,
    );
  }

  void _showDeleteDialog(BookModel book) {
    BookDeleteDialog.show(
      context: context,
      book: book,
      onDelete: () => _deleteBook(book),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppHeader(
        pageTitle: l10n.booksTab,
        selectedPage: AppMenuPage.adminArea,
        isAdmin: true,
        onDashboard: _openDashboard,
        onSettings: _openSettings,
        onAdminArea: _openAdminArea,
        onLogout: _logout,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateDialog,
        child: const Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 24,
              vertical: isMobile ? 16 : 24,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdminNavigationTabs(
                      selectedTab: AdminTab.books,
                      onTabSelected: (tab) {
                        switch (tab) {
                          case AdminTab.users:
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.usersPage,
                            );
                            break;

                          case AdminTab.publishers:
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.publishersPage,
                            );
                            break;

                          case AdminTab.books:
                            break;

                          case AdminTab.rentals:
                              Navigator.of(context).pushReplacementNamed(
                              AppRoutes.rentalsPage,
                            );
                            break;
                        }
                      },
                    ),
                    SizedBox(height: isMobile ? 16 : 24),
                    AdminSearchBar(
                      onChanged: _onSearchChanged,
                      onFilterPressed: () {},
                    ),
                    SizedBox(height: isMobile ? 14 : 20),
                    AdminListContainer(
                      child: _buildContent(l10n),
                    ),
                    if (!_isLoading && _errorMessage == null) ...[
                      const SizedBox(height: 18),
                      AdminPagination(
                        currentPage: _currentPage,
                        totalPages: _totalPages,
                        onPageChanged: _onPageChanged,
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(
              Icons.error_outline,
              size: 42,
            ),
            const SizedBox(height: 12),
            Text(
              _errorMessage!,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadBooks,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_books.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            const Icon(
              Icons.menu_book_outlined,
              size: 44,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.noResults,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        ..._books.map(
          (book) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BookListItem(
              book: book,
              onEdit: () => _showEditDialog(book),
              onDelete: () => _showDeleteDialog(book),
            ),
          ),
        ),
      ],
    );
  }
}
