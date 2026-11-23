
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class AdminSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterPressed;

  const AdminSearchBar({
    super.key,
    required this.onChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colors.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(
            Icons.search,
            size: 18,
            color: colors.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: theme.textTheme.bodySmall,
              decoration: InputDecoration(
                hintText: l10n.adminSearchHint,
                hintStyle: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
