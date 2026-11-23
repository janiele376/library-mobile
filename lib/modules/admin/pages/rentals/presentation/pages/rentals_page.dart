
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

import '../../models/rental_model.dart';
import '../../models/rental_update_model.dart';
import '../../services/rental_service.dart';

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
  final RentalService _rentalService = RentalService();

  List<RentalModel> _rentals = [];

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
    _loadRentals();
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

  Future<void> _loadRentals() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _rentalService.getRentals(
        userName: _searchQuery.isEmpty ? null : _searchQuery,
        page: _currentPage - 1,
        size: _pageSize,
      );

      if (!mounted) return;

      setState(() {
        _rentals = result.content;
        _totalPages = result.totalPages < 1
            ? 1
            : result.totalPages;
        _currentPage = result.currentPage + 1;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _errorMessage =
            AppLocalizations.of(context)!.rentalLoadError;
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
        _loadRentals();
      },
    );
  }

  void _onPageChanged(int page) {
    if (page < 1 || page > _totalPages) return;

    setState(() {
      _currentPage = page;
    });

    _loadRentals();
  }

  Future<void> _createRental(Map<String, dynamic> data) async {
    try {
      await _rentalService.createRental(
        usersId: data['usersId'] as int,
        booksId: data['booksId'] as int,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.rentalCreateSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      _currentPage = 1;
      await _loadRentals();
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
    try {
      await _rentalService.updateRental(
        id: rental.id,
        usersId: rental.usersId,
        booksId: rental.booksId,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.rentalUpdateSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      await _loadRentals();
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
    try {
      await _rentalService.deleteRental(rental.id);

      if (!mounted) return;

      if (_rentals.length == 1 && _currentPage > 1) {
        _currentPage--;
      }

      await _loadRentals();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.rentalDeleteSuccess,
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

  Future<void> _renewRental(RentalModel rental) async {
    try {
      await _rentalService.renewRental(rental.id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.rentalRenewSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      await _loadRentals();
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
    try {
      await _rentalService.returnRental(rental.id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.rentalReturnSuccess,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      await _loadRentals();
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
              onPressed: _loadRentals,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_rentals.isEmpty) {
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
        ..._rentals.map(
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
