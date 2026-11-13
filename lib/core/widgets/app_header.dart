
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'app_menu.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? pageTitle;
  final AppMenuPage? selectedPage;
  final bool isAdmin;
  final VoidCallback? onDashboard;
  final VoidCallback? onAccessibility;
  final VoidCallback? onProfile;
  final VoidCallback? onAdminArea;
  final VoidCallback? onLogout;

  const AppHeader({
    super.key,
    this.pageTitle,
    this.selectedPage,
    this.isAdmin = false,
    this.onDashboard,
    this.onAccessibility,
    this.onProfile,
    this.onAdminArea,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final hasMenu = onDashboard != null &&
        onAccessibility != null &&
        onLogout != null &&
        (isAdmin ? (onAdminArea != null || onProfile != null) : onProfile != null);

    return AppBar(
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: hasMenu
          ? PopupMenuButton<int>(
              tooltip: 'Menu',
              icon: Icon(
                Icons.menu,
                color: colors.onSurface,
              ),
              padding: EdgeInsets.zero,
              offset: const Offset(0, 8),
              color: Colors.transparent,
              elevation: 0,
              constraints: const BoxConstraints(
                minWidth: 220,
                maxWidth: 220,
              ),
              itemBuilder: (menuContext) => [
                PopupMenuItem<int>(
                  padding: EdgeInsets.zero,
                  height: 0,
                  child: AppMenu(
                    selectedPage: selectedPage,
                    isAdmin: isAdmin,
                    onDashboard: () {
                      Navigator.of(menuContext).pop();
                      onDashboard?.call();
                    },
                    onAccessibility: () {
                      Navigator.of(menuContext).pop();
                      onAccessibility?.call();
                    },
                    onProfile: () {
                      Navigator.of(menuContext).pop();
                      onProfile?.call();
                    },
                    onAdminArea: () {
                      Navigator.of(menuContext).pop();
                      (onAdminArea ?? onProfile)?.call();
                    },
                    onLogout: () {
                      Navigator.of(menuContext).pop();
                      onLogout?.call();
                    },
                  ),
                ),
              ],
            )
          : null,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book_outlined,
            size: 28,
            color: colors.onSurface,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              pageTitle == null
                  ? l10n.appTitle
                  : '${l10n.appTitle} $pageTitle',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
