
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class AdminPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const AdminPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  }) : assert(currentPage >= 1),
       assert(totalPages >= 1),
       assert(currentPage <= totalPages);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final hasPrevious = currentPage > 1;
    final hasNext = currentPage < totalPages;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: hasPrevious
              ? () => onPageChanged(currentPage - 1)
              : null,
          tooltip: l10n.previousPage,
          icon: const Icon(Icons.chevron_left),
          color: colors.primary,
          disabledColor: colors.onSurface.withValues(alpha: 0.3),
        ),
        Text(
          '$currentPage / $totalPages',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: hasNext
              ? () => onPageChanged(currentPage + 1)
              : null,
          tooltip: l10n.nextPage,
          icon: const Icon(Icons.chevron_right),
          color: colors.primary,
          disabledColor: colors.onSurface.withValues(alpha: 0.3),
        ),
      ],
    );
  }
}
