
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
import '../../controllers/users_page_controller.dart';
import '../../models/user_model.dart';
import '../widgets/user_delete_dialog.dart';
import '../widgets/user_edit_dialog.dart';
import '../widgets/user_list_item.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late final UsersPageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = UsersPageController();
    _controller.addListener(_onControllerChanged);
    _controller.loadUsers();
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
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

  Future<void> _editUser(UserModel user) async {
    final l10n = AppLocalizations.of(context)!;

    await UserEditDialog.show(
      context: context,
      user: user,
      onSave: (updatedUser) async {
        try {
          await _controller.updateUser(updatedUser);

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.userUpdateSuccess),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.userUpdateError(error.toString())),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
    );
  }

  Future<void> _deleteUser(UserModel user) async {
    final l10n = AppLocalizations.of(context)!;

    await UserDeleteDialog.show(
      context: context,
      userName: user.nameCompleted,
      onConfirm: () async {
        try {
          await _controller.deleteUser(user.id);

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.userDeleteSuccess),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (error) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.userDeleteError(error.toString())),
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
        pageTitle: l10n.usersTab,
        selectedPage: AppMenuPage.adminArea,
        isAdmin: true,
        onDashboard: _openDashboard,
        onSettings: _openSettings,
        onAdminArea: _openAdminArea,
        onLogout: _logout,
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
                      selectedTab: AdminTab.users,
                      onTabSelected: (tab) {
                        switch (tab) {
                          case AdminTab.users:
                            break;
                          case AdminTab.publishers:
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.publishersPage,
                            );
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
              l10n.userLoadError,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _controller.loadUsers,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_controller.users.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            const Icon(
              Icons.people_outline,
              size: 44,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.userNoResults,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        ..._controller.users.map(
          (user) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: UserListItem(
              user: user,
              onEdit: () => _editUser(user),
              onDelete: () => _deleteUser(user),
            ),
          ),
        ),
      ],
    );
  }
}
