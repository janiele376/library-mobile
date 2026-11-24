
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import 'rental_create_form.dart';

class RentalCreateDialog extends StatelessWidget {
  final ValueChanged<Map<String, dynamic>> onSave;

  const RentalCreateDialog({
    super.key,
    required this.onSave,
  });

  static Future<void> show({
    required BuildContext context,
    required ValueChanged<Map<String, dynamic>> onSave,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return RentalCreateDialog(onSave: onSave);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Dialog(
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 520,
          maxHeight: screenHeight * 0.88,
        ),
        child: SizedBox(
          width: screenWidth < 552 ? double.infinity : 520,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 16, 18),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: colors.tertiary,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        Icons.assignment_outlined,
                        color: colors.onTertiary,
                        size: 23,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.rentalCreateTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            l10n.rentalCreateSubtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: l10n.close,
                      icon: Icon(
                        Icons.close,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: colors.outlineVariant.withValues(alpha: 0.5),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: RentalCreateForm(
                    onSave: (rentalData) {
                      onSave(rentalData);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
