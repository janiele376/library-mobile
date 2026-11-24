
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

import '../../controllers/rental_page_controller.dart';
import '../../models/rental_model.dart';
import '../../models/rental_update_model.dart';

import '../widgets/rental_list_item.dart';
import '../widgets/rental_create_dialog.dart';
import '../widgets/rental_edit_dialog.dart';
import '../widgets/rental_delete_dialog.dart';
import '../widgets/rental_renew_dialog.dart';
import '../widgets/rental_return_dialog.dart';

class RentalsPage extends StatefulWidget {
  const RentalsPage({super.key});

  @override
  State<RentalsPage> createState() => _RentalsPageState();
}

class _RentalsPageState extends State<RentalsPage> {
  late final RentalPageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = RentalPageController();
    _controller.addListener(_onControllerChanged);
    _controller.loadRentals();
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
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

  Future<void> _createRental(Map<String, dynamic> data) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await _controller.createRental(
        usersId: data['usersId'] as int,
        booksId: data['booksId'] as int,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.rentalCreateSuccess),
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

  Future<void> _updateRental(RentalUpdateModel rental) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await _controller.updateRental(
        id: rental.id,
        usersId: rental.usersId,
        booksId: rental.booksId,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.rentalUpdateSuccess),
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

  Future<void> _deleteRental(RentalModel rental) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await _controller.deleteRental(rental.id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.rentalDeleteSuccess),
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

  Future<void> _renewRental(RentalModel rental) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await _controller.renewRental(rental.id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.rentalRenewSuccess),
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

  Future<void> _returnRental(RentalModel rental) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await _controller.returnRental(rental.id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.rentalReturnSuccess),
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
    RentalCreateDialog.show(
      context: context,
      onSave: _createRental,
    );
  }

  void _showEditDialog(RentalModel rental) {
    RentalEditDialog.show(
      context: context,
      rental: rental,
      onSave: _updateRental,
    );
  }

  void _showDeleteDialog(RentalModel rental) {
    RentalDeleteDialog.show(
      context: context,
      rental: rental,
      onDelete: () => _deleteRental(rental),
    );
  }

  void _showRenewDialog(RentalModel rental) {
    RentalRenewDialog.show(
      context: context,
      rental: rental,
      onRenew: () => _renewRental(rental),
    );
  }

  void _showReturnDialog(RentalModel rental) {
    RentalReturnDialog.show(
      context: context,
      rental: rental,
      onReturn: () => _returnRental(rental),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppHeader(
        pageTitle: l10n.rentalsTab,
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
                      selectedTab: AdminTab.rentals,
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
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.booksPage,
                            );
                            break;

                          case AdminTab.rentals:
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
              l10n.rentalLoadError,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _controller.loadRentals,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_controller.rentals.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            const Icon(
              Icons.assignment_outlined,
              size: 44,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.rentalNoResults,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        ..._controller.rentals.map(
          (rental) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RentalListItem(
              rental: rental,
              onEdit: rental.status == 'RETURNED'
                  ? null
                  : () => _showEditDialog(rental),
              onDelete: rental.status == 'RETURNED'
                  ? () => _showDeleteDialog(rental)
                  : null,
              onRenew: rental.status == 'RETURNED'
                  ? null
                  : () => _showRenewDialog(rental),
              onReturn: rental.status == 'RETURNED'
                  ? null
                  : () => _showReturnDialog(rental),
            ),
          ),
        ),
      ],
    );
  }
}
