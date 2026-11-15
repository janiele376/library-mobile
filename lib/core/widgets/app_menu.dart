
import 'package:flutter/material.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

enum AppMenuPage {
  dashboard,
  settings,
  adminArea,
}

class AppMenu extends StatelessWidget {
  final AppMenuPage? selectedPage;
  final bool isAdmin;
  final VoidCallback onDashboard;
  final VoidCallback onSettings;
  final VoidCallback? onAdminArea;
  final VoidCallback onLogout;

  const AppMenu({
    super.key,
    this.selectedPage,
    this.isAdmin = false,
    required this.onDashboard,
    required this.onSettings,
    this.onAdminArea,
    required this.onLogout,
  });

  Future<void> _confirmLogout(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final theme = Theme.of(dialogContext);
        final colors = theme.colorScheme;

        return AlertDialog(
          backgroundColor: colors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            l10n.logoutConfirmation,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.onSurface,
              fontFamily: 'serif',
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green.shade100,
                foregroundColor: Colors.green.shade900,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(
                l10n.confirm,
                style: const TextStyle(
                  fontFamily: 'serif',
                  fontSize: 11,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade100,
                foregroundColor: Colors.red.shade900,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: Text(
                l10n.cancel,
                style: const TextStyle(
                  fontFamily: 'serif',
                  fontSize: 11,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      onLogout();
    }
  }

  Widget _menuItem({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    required bool selected,
    bool logout = false,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final backgroundColor = selected ? colors.primary : colors.tertiary;
    final foregroundColor = colors.onPrimary;

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 42,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: foregroundColor,
                  fontFamily: 'serif',
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              if (logout) ...[
                const SizedBox(width: 5),
                Icon(
                  Icons.logout,
                  color: foregroundColor,
                  size: 15,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: 220,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 44,
            color: colors.tertiary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: colors.onPrimary,
                  size: 17,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.menuTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colors.onPrimary,
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _menuItem(
            context: context,
            title: l10n.dashboardTitle,
            selected: selectedPage == AppMenuPage.dashboard,
            onTap: onDashboard,
          ),
          _menuItem(
            context: context,
            title: l10n.settingsTitle,
            selected: selectedPage == AppMenuPage.settings,
            onTap: onSettings,
          ),
          if (isAdmin && onAdminArea != null)
            _menuItem(
              context: context,
              title: l10n.adminAreaTitle,
              selected: selectedPage == AppMenuPage.adminArea,
              onTap: onAdminArea!,
            ),
          _menuItem(
            context: context,
            title: l10n.logout,
            selected: false,
            onTap: () => _confirmLogout(context),
            logout: true,
          ),
        ],
      ),
    );
  }
}
