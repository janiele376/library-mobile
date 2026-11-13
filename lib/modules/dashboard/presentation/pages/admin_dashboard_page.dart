
import 'package:flutter/material.dart';

import '../../../../core/services/auth/session_service.dart';
import '../../../../core/services/routes/app_routes.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/app_menu.dart';
import '../../../../l10n/app_localizations.dart';
import '../../controllers/admin_dashboard_controller.dart';
import '../../models/admin_dashboard_response.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/most_rented_book_card.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final AdminDashboardController _controller = AdminDashboardController();

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

  void _openAdminArea() {
    final l10n = AppLocalizations.of(context)!;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.dashboardAdminAreaUnavailable),
      ),
    );
  }

  Widget _buildGlobalStats(AdminDashboardResponse dashboard) {
    final l10n = AppLocalizations.of(context)!;

    return DashboardSection(
      title: l10n.dashboardGlobalStats,
      child: DashboardStatsGrid(
        cards: [
          DashboardStatCard(
            title: l10n.dashboardTotalRentals,
            value: dashboard.totalRentals,
            icon: Icons.assignment_outlined,
          ),
          DashboardStatCard(
            title: l10n.dashboardTotalBooks,
            value: dashboard.totalBooks,
            icon: Icons.menu_book_outlined,
          ),
          DashboardStatCard(
            title: l10n.dashboardTotalPublishers,
            value: dashboard.totalPublishers,
            icon: Icons.business_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildRentalStatus(AdminDashboardResponse dashboard) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return DashboardSection(
      title: l10n.dashboardRentalStatus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DashboardStatsGrid(
            cards: [
              DashboardStatCard(
                title: l10n.dashboardOnTime,
                value: dashboard.onTimeRentals,
                icon: Icons.check_circle_outline,
                color: Colors.green,
              ),
              DashboardStatCard(
                title: l10n.dashboardNearDue,
                value: dashboard.nearDueRentals,
                icon: Icons.access_time,
                color: Colors.orange,
              ),
              DashboardStatCard(
                title: l10n.dashboardOverdue,
                value: dashboard.overdueRentals,
                icon: Icons.warning_amber_rounded,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: null,
            style: TextButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              disabledBackgroundColor: colors.primary,
              disabledForegroundColor: colors.onPrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(l10n.dashboardViewMore),
          ),
        ],
      ),
    );
  }

  Widget _buildMostRentedBook(AdminDashboardResponse dashboard) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final book = dashboard.mostRentedBook;

    return DashboardSection(
      title: l10n.dashboardMostRentedBook,
      child: book == null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.dashboardNoBooks,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurface,
                  fontFamily: 'serif',
                ),
              ),
            )
          : MostRentedBookCard(
              book: book,
              publisherLabel: l10n.dashboardPublisher,
              releaseDateLabel: l10n.dashboardReleaseDate,
              quantityLabel: l10n.dashboardRentalQuantity,
            ),
    );
  }

  Widget _buildDashboard(AdminDashboardResponse dashboard) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 700;

        if (!isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildGlobalStats(dashboard),
              const SizedBox(height: 20),
              _buildRentalStatus(dashboard),
              const SizedBox(height: 20),
              _buildMostRentedBook(dashboard),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildGlobalStats(dashboard),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildRentalStatus(dashboard),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildMostRentedBook(dashboard),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final dashboard = _controller.dashboard;

    if (_controller.isLoading && dashboard == null) {
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
                size: 48,
                color: colors.error,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.dashboardLoadError,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _controller.loadDashboard,
                child: Text(l10n.dashboardRetry),
              ),
            ],
          ),
        ),
      );
    }

    if (dashboard == null) {
      return Center(
        child: Text(
          l10n.dashboardNoData,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _controller.loadDashboard,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            children: [
              _buildDashboard(dashboard),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppHeader(
        pageTitle: l10n.dashboardTitle,
        selectedPage: AppMenuPage.dashboard,
        isAdmin: true,
        onDashboard: _openDashboard,
        onAccessibility: _openAccessibility,
        onAdminArea: _openAdminArea,
        onLogout: _logout,
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) => _buildBody(),
      ),
    );
  }
}
