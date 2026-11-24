
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

import '../../controllers/publishers_page_controller.dart';
import '../../models/publisher_model.dart';
import '../../models/publisher_update_model.dart';

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
  late final PublishersPageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PublishersPageController();
    _controller.addListener(_onControllerChanged);

    _controller.loadPublishers();
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

  void _createPublisher() {
    final l10n = AppLocalizations.of(context)!;

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
          await _controller.createPublisher(
            name: name,
            cnpj: cnpj,
            email: email,
            phone: phone,
            address: address,
          );

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.publisherCreateSuccess),
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.publisherCreateError),
            ),
          );

          rethrow;
        }
      },
    );
  }

  Future<void> _editPublisher(PublisherModel publisher) async {
    final l10n = AppLocalizations.of(context)!;

    await PublisherEditDialog.show(
      context: context,
      publisher: publisher,
      onSave: (PublisherUpdateModel updatedPublisher) async {
        try {
          await _controller.updatePublisher(
            id: updatedPublisher.id,
            name: updatedPublisher.name,
            email: updatedPublisher.email,
            phone: updatedPublisher.phone,
            address: updatedPublisher.address,
          );

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.publisherUpdateSuccess),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.publisherUpdateError),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
    );
  }

  Future<void> _deletePublisher(PublisherModel publisher) async {
    final l10n = AppLocalizations.of(context)!;

    await PublisherDeleteDialog.show(
      context: context,
      publisherName: publisher.name,
      onConfirm: () async {
        try {
          await _controller.deletePublisher(publisher.id);

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.publisherDeleteSuccess),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.publisherDeleteError),
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
        pageTitle: l10n.publisherPageTitle,
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
              l10n.publisherLoadError,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _controller.loadPublishers,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_controller.publishers.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            const Icon(
              Icons.business_outlined,
              size: 44,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.publisherNoResults,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        ..._controller.publishers.map(
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
