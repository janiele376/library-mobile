
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class ProfileActionButtons extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool isSaving;

  const ProfileActionButtons({
    super.key,
    required this.isEditing,
    required this.onEdit,
    required this.onConfirm,
    required this.onCancel,
    this.isSaving = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    if (!isEditing) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onEdit,
          icon: const Icon(Icons.edit_outlined),
          label: Text(l10n.editInformation),
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
          ),
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: isSaving ? null : onCancel,
            child: Text(l10n.cancel),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
            ),
            onPressed: isSaving ? null : onConfirm,
            child: isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : Text(l10n.confirm),
            
          ),
        ),
      ],
    );
  }
}
