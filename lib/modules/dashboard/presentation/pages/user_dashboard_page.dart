
import 'package:flutter/material.dart';

import '../../../../core/services/auth/session_service.dart';
import '../../../../core/services/routes/app_routes.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/app_menu.dart';
import '../../../../l10n/app_localizations.dart';
import '../../controllers/user_dashboard_controller.dart';
import '../../models/user_dashboard_response.dart';
import '../widgets/dashboard_book_card.dart';
import '../widgets/dashboard_rental_card.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/most_rented_book_card.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  final UserDashboardController _controller = UserDashboardController();

  @override
  void initState() {
    super.initState();
    _controller.loadDashboard();
  }

  @override
  void dispose() {
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
    _controller.loadDashboard();
  }

  void _openAccessibility() {
    final l10n = AppLocalizations.of(context)!;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.dashboardAccessibilityUnavailable),
      ),
    );
  }

  void _openProfile() {
    final l10n = AppLocalizations.of(context)!;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.dashboardProfileUnavailable),
      ),
    );
  }

  String _statusLabel(String status) {
    final l10n = AppLocalizations.of(context)!;

    switch (status.toUpperCase()) {
      case 'ON_TIME':
        return l10n.dashboardOnTime;
      case 'NEAR_DUE':
        return l10n.dashboardStatusNearDue;
      case 'OVERDUE':
        return l10n.dashboardOverdue;
      default:
        return status;
    }
  }

  Widget _buildLastRentals(UserDashboardResponse dashboard) {
    final l10n = AppLocalizations.of(context)!;

    return DashboardSection(
      title: l10n.dashboardLastRentals,
      child: dashboard.lastRentals.isEmpty
          ? Text(l10n.dashboardNoRentals)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < dashboard.lastRentals.length; i++)
                  DashboardRentalCard(
                    rental: dashboard.lastRentals[i],
                    index: i + 1,
                    formatDate: DateFormatter.format,
                    statusLabel: _statusLabel,
                  ),
              ],
            ),
    );
  }

  Widget _buildRentalStatus(UserDashboardResponse dashboard) {
    final l10n = AppLocalizations.of(context)!;

    return DashboardSection(
      title: l10n.dashboardRentalStatus,
      child: DashboardStatsGrid(
        cards: [
          DashboardStatCard(
            title: l10n.dashboardOnTime,
            value: dashboard.onTimeRentals,
            icon: Icons.check_circle,
            color: Colors.green,
          ),
          DashboardStatCard(
            title: l10n.dashboardNearDue,
            value: dashboard.nearDueRentals,
            icon: Icons.access_time_filled,
            color: Colors.orange,
          ),
          DashboardStatCard(
            title: l10n.dashboardOverdue,
            value: dashboard.overdueRentals,
            icon: Icons.error,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildMostRentedBook(UserDashboardResponse dashboard) {
    final l10n = AppLocalizations.of(context)!;

    return DashboardSection(
      title: l10n.dashboardMostRentedBook,
      child: dashboard.mostRentedBookDetails == null
          ? Text(l10n.dashboardNoBooks)
          : MostRentedBookCard(
              book: dashboard.mostRentedBookDetails!,
              publisherLabel: l10n.dashboardPublisher,
              releaseDateLabel: l10n.dashboardReleaseDate,
              quantityLabel: l10n.dashboardQuantity,
            ),
    );
  }

  Widget _buildAvailableBooks(UserDashboardResponse dashboard) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return DashboardSection(
      title: l10n.dashboardAvailableBooks,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dashboardTotalAvailableBooks(
              dashboard.totalAvailableBooks,
            ),
            style: theme.textTheme.titleSmall?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          if (dashboard.availableBooks.isEmpty)
            Text(l10n.dashboardNoAvailableBooks)
          else
            for (final book in dashboard.availableBooks)
              DashboardBookCard(
                book: book,
                quantityLabel: l10n.dashboardQuantity,
              ),
        ],
      ),
    );
  }

  Widget _buildDashboard(UserDashboardResponse dashboard) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 750;

        final lastRentals = _buildLastRentals(dashboard);
        final rentalStatus = _buildRentalStatus(dashboard);
        final mostRentedBook = _buildMostRentedBook(dashboard);
        final availableBooks = _buildAvailableBooks(dashboard);

        if (!isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              lastRentals,
              const SizedBox(height: 20),
              rentalStatus,
              const SizedBox(height: 20),
              mostRentedBook,
              const SizedBox(height: 20),
              availableBooks,
            ],
          );
        }

        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: lastRentals),
                const SizedBox(width: 20),
                Expanded(child: rentalStatus),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: mostRentedBook),
                const SizedBox(width: 20),
                Expanded(child: availableBooks),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppHeader(
        selectedPage: AppMenuPage.dashboard,
        onDashboard: _openDashboard,
        onAccessibility: _openAccessibility,
        onProfile: _openProfile,
        onLogout: _logout,
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          if (_controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: colors.primary,
              ),
            );
          }

          if (_controller.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: colors.error,
                      size: 42,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.dashboardLoadError,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _controller.loadDashboard,
                      child: Text(l10n.dashboardRetry),
                    ),
                  ],
                ),
              ),
            );
          }

          final dashboard = _controller.dashboard;

          if (dashboard == null) {
            return Center(
              child: Text(l10n.dashboardNoData),
            );
          }

          return RefreshIndicator(
            onRefresh: _controller.loadDashboard,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 28,
                  ),
                  children: [
                    _buildDashboard(dashboard),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
