
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class AppHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final String? pageTitle;

  const AppHeader({
    super.key,
    this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      centerTitle: true,
      automaticallyImplyLeading: false,
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
