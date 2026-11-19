
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

enum AdminTab {
  users,
  rentals,
  books,
  publishers,
}

class AdminNavigationTabs extends StatelessWidget {
  final AdminTab selectedTab;
  final ValueChanged<AdminTab> onTabSelected;

  const AdminNavigationTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final tabs = [
      (tab: AdminTab.users, title: l10n.usersTab),
      (tab: AdminTab.rentals, title: l10n.rentalsTab),
      (tab: AdminTab.books, title: l10n.booksTab),
      (tab: AdminTab.publishers, title: l10n.publishersTab),
    ];

    return SizedBox(
      width: double.infinity,
      height: 34,
      child: Row(
        children: tabs.map((item) {
          final isSelected = selectedTab == item.tab;

          return Expanded(
            child: Material(
              color: isSelected ? colors.primary : colors.tertiary,
              child: InkWell(
                onTap: () => onTabSelected(item.tab),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.onPrimary,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
