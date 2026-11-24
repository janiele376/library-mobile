
import 'package:flutter/material.dart';

import '../../../../core/services/auth/session_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../accessibility/presentation/pages/accessibility_page.dart';
import '../adjustments/presentation/pages/adjustments_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Future<bool> _adminFuture;

  @override
  void initState() {
    super.initState();
    _adminFuture = SessionService.isAdmin();
  }

  Widget _buildSettingsContent({
    required BuildContext context,
    required bool isAdmin,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final tabs = <Widget>[
      if (!isAdmin) Tab(text: l10n.profile),
      Tab(text: l10n.accessibility),
    ];

    final pages = <Widget>[
      if (!isAdmin) const AdjustmentsPage(),
      const AccessibilityPage(),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            constraints: const BoxConstraints(maxWidth: 700),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TabBar(
              tabs: tabs,
              labelColor: colors.onPrimary,
              unselectedLabelColor: colors.onSurfaceVariant,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              dividerColor: Colors.transparent,
              labelStyle: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: 'serif',
              ),
              unselectedLabelStyle: theme.textTheme.titleSmall?.copyWith(
                fontFamily: 'serif',
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: CircularProgressIndicator(
        color: colors.primary,
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

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
              l10n.settingsLoadError,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colors.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                setState(() {
                  _adminFuture = SessionService.isAdmin();
                });
              },
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
        leading: IconButton(
          tooltip: l10n.back,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        centerTitle: true,
        title: Text(
          l10n.settingsTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            color: colors.onSurface,
            fontFamily: 'serif',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder<bool>(
        future: _adminFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading(context);
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return _buildError(context);
          }

          return _buildSettingsContent(
            context: context,
            isAdmin: snapshot.data!,
          );
        },
      ),
    );
  }
}
