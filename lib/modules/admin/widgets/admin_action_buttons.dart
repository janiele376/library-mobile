
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class AdminActionButtons extends StatelessWidget {
  final VoidCallback? onView;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRenew;
  final VoidCallback? onReturn;

  const AdminActionButtons({
    super.key,
    this.onView,
    this.onEdit,
    this.onDelete,
    this.onRenew,
    this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onView != null)
          IconButton(
            onPressed: onView,
            tooltip: l10n.view,
            icon: const Icon(Icons.visibility_outlined),
            color: colors.primary,
            visualDensity: VisualDensity.compact,
          ),
        if (onEdit != null)
          IconButton(
            onPressed: onEdit,
            tooltip: l10n.edit,
            icon: const Icon(Icons.edit_outlined),
            color: colors.primary,
            visualDensity: VisualDensity.compact,
          ),
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            tooltip: l10n.delete,
            icon: const Icon(Icons.delete_outline),
            color: colors.error,
            visualDensity: VisualDensity.compact,
          ),
        if (onRenew != null)
          IconButton(
            onPressed: onRenew,
            tooltip: l10n.renew,
            icon: const Icon(Icons.autorenew),
            color: colors.primary,
            visualDensity: VisualDensity.compact,
          ),
        if (onReturn != null)
          IconButton(
            onPressed: onReturn,
            tooltip: l10n.returnBook,
            icon: const Icon(Icons.assignment_return_outlined),
            color: colors.primary,
            visualDensity: VisualDensity.compact,
          ),
      ],
    );
  }
}
