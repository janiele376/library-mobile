
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
import '../../models/publisher_model.dart';
import '../../models/publisher_update_model.dart';
import '../../services/publisher_service.dart';
import '../widgets/publisher_create_dialog.dart';
import '../widgets/publisher_delete_dialog.dart';
import '../widgets/publisher_edit_dialog.dart';
import '../widgets/publisher_list_item.dart';

class PublishersPage extends StatefulWidget {
  const PublishersPage({super.key});

  @override
  State<PublishersPage> createState() => _PublishersPageState();
}

class _PublishersPageState extends State<PublishersPage> {
  final PublisherService _publisherService = PublisherService();

  List<PublisherModel> _publishers = [];

  bool _isLoading = true;
  String? _errorMessage;

  String _search = '';
  int _currentPage = 1;
  int _totalPages = 1;

  Timer? _searchDebounce;

  static const int _pageSize = 5;

  @override
  void initState() {
    super.initState();
    _loadPublishers();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
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

  Future<void> _loadPublishers() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _publisherService.getPublishers(
        name: _search,
        page: _currentPage - 1,
        size: _pageSize,
      );

      if (!mounted) return;

      setState(() {
        _publishers = result.content;
        _totalPages = result.totalPages < 1
            ? 1
            : result.totalPages;
        _currentPage = result.currentPage + 1;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _errorMessage = error.toString();
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String value) {
    _search = value;
    _currentPage = 1;

    _searchDebounce?.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: 400),
      _loadPublishers,
    );
  }

  void _onPageChanged(int page) {
    if (page < 1 || page > _totalPages) return;

    setState(() {
      _currentPage = page;
    });

    _loadPublishers();
  }


  void _createPublisher() {
    PublisherCreateDialog.show(
      context: context,
      onSave: ({
        required String name,
        required String cnpj,
        required String email,
        required String phone,
        required String address,
      }) async {
        try {
          await _publisherService.createPublisher(
            name: name,
            cnpj: cnpj,
            email: email,
            phone: phone,
            address: address,
          );

          await _loadPublishers();

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Editora cadastrada com sucesso!'),
            ),
          );
        } catch (e) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao cadastrar editora: $e'),
            ),
          );

          rethrow;
        }
      },
    );
  }

  Future<void> _editPublisher(PublisherModel publisher) async {
    await PublisherEditDialog.show(
      context: context,
      publisher: publisher,
      onSave: (PublisherUpdateModel updatedPublisher) async {
        try {
          await _publisherService.updatePublisher(
            id: updatedPublisher.id,
            name: updatedPublisher.name,
            email: updatedPublisher.email,
            phone: updatedPublisher.phone,
            address: updatedPublisher.address,
          );

          if (!mounted) return;

          await _loadPublishers();

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Editora atualizada com sucesso!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao atualizar editora: $error'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
    );
  }

  Future<void> _deletePublisher(PublisherModel publisher) async {
    await PublisherDeleteDialog.show(
      context: context,
      publisherName: publisher.name,
      onConfirm: () async {
        try {
          await _publisherService.deletePublisher(publisher.id);

          if (!mounted) return;

          if (_publishers.length == 1 && _currentPage > 1) {
            _currentPage--;
          }

          await _loadPublishers();

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Editora excluída com sucesso!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao excluir editora: $error'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppHeader(
        pageTitle: 'Editoras',
        selectedPage: AppMenuPage.adminArea,
        isAdmin: true,
        onDashboard: _openDashboard,
        onSettings: _openSettings,
        onAdminArea: _openAdminArea,
        onLogout: _logout,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPublisher,
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
                      selectedTab: AdminTab.publishers,
                      onTabSelected: (tab) {
                        switch (tab) {
                          case AdminTab.users:
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.usersPage,
                            );
                            break;

                          case AdminTab.publishers:
                            break;

                          case AdminTab.books:
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.booksPage,
                            );
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
              onPressed: _loadPublishers,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_publishers.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            Icon(
              Icons.business_outlined,
              size: 44,
            ),
            SizedBox(height: 12),
            Text(
              'Nenhuma editora encontrada.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        ..._publishers.map(
          (publisher) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: PublisherListItem(
              publisher: publisher,
              onEdit: () => _editPublisher(publisher),
              onDelete: () => _deletePublisher(publisher),
            ),
          ),
        ),
      ],
    );
  }
}
