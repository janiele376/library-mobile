
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

import '../../controllers/books_page_controller.dart';
import '../../models/book_model.dart';
import '../../models/book_update_model.dart';

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
  late final BooksPageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = BooksPageController();
    _controller.addListener(_onControllerChanged);

    _controller.loadBooks();
  }

  void _onControllerChanged() {
    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();

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

  Future<void> _createBook(Map<String, dynamic> data) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await _controller.createBook(
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
          content: Text(l10n.bookCreateSuccess),
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

  Future<void> _updateBook(BookUpdateModel book) async {
    try {
      await _controller.updateBook(
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
      await _controller.deleteBook(book.id);

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
                      onChanged: _controller.onSearchChanged,
                      onFilterPressed: () {},
                    ),
                    SizedBox(height: isMobile ? 14 : 20),
                    AdminListContainer(
                      child: _buildContent(l10n),
                    ),
                    if (!_controller.isLoading &&
                        !_controller.hasError) ...[
                      const SizedBox(height: 18),
                      AdminPagination(
                        currentPage: _controller.currentPage,
                        totalPages: _controller.totalPages,
                        onPageChanged: _controller.changePage,
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
    if (_controller.isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_controller.hasError) {
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
              l10n.bookLoadError,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _controller.loadBooks,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_controller.books.isEmpty) {
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
        ..._controller.books.map(
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
