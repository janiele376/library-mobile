
import 'package:flutter/material.dart';

enum AppMenuPage {
  dashboard,
  accessibility,
  profile,
  adminArea,
}

class AppMenu extends StatelessWidget {
  final AppMenuPage? selectedPage;
  final bool isAdmin;
  final VoidCallback onDashboard;
  final VoidCallback onAccessibility;
  final VoidCallback onProfile;
  final VoidCallback? onAdminArea;
  final VoidCallback onLogout;

  const AppMenu({
    super.key,
    this.selectedPage,
    this.isAdmin = false,
    required this.onDashboard,
    required this.onAccessibility,
    required this.onProfile,
    this.onAdminArea,
    required this.onLogout,
  });

  Future<void> _confirmLogout(BuildContext context) async {
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
            'Deseja Sair do Sistema?',
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
              child: const Text(
                'CONFIRMAR',
                style: TextStyle(
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
              child: const Text(
                'CANCELAR',
                style: TextStyle(
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
    required bool alternate,
    bool logout = false,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final backgroundColor = selected
        ? colors.primary
        : alternate
            ? colors.tertiary
            : colors.secondary;

    final foregroundColor = selected
        ? colors.onPrimary
        : alternate
            ? colors.onPrimary
            : colors.onSurface;

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
                  fontWeight: selected
                      ? FontWeight.w600
                      : FontWeight.normal,
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
                  'MENU',
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
            title: 'Dashboard',
            selected: selectedPage == AppMenuPage.dashboard,
            alternate: true,
            onTap: onDashboard,
          ),
          _menuItem(
            context: context,
            title: 'Acessibilidade',
            selected: selectedPage == AppMenuPage.accessibility,
            alternate: true,
            onTap: onAccessibility,
          ),
          if (isAdmin)
            _menuItem(
              context: context,
              title: 'Área do ADM',
              selected: selectedPage == AppMenuPage.adminArea,
              alternate: true,
              onTap: onAdminArea ?? onProfile,
            )
          else
            _menuItem(
              context: context,
              title: 'Perfil',
              selected: selectedPage == AppMenuPage.profile,
              alternate: true,
              onTap: onProfile,
            ),
          _menuItem(
            context: context,
            title: 'Sair',
            selected: false,
            alternate: true,
            onTap: () => _confirmLogout(context),
            logout: true,
          ),
        ],
      ),
    );
  }
}
