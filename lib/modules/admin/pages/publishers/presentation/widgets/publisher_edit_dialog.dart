
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../models/publisher_model.dart';
import '../../models/publisher_update_model.dart';
import 'publisher_edit_form.dart';

class PublisherEditDialog extends StatelessWidget {
  final PublisherModel publisher;
  final ValueChanged<PublisherUpdateModel> onSave;

  const PublisherEditDialog({
    super.key,
    required this.publisher,
    required this.onSave,
  });

  static Future<void> show({
    required BuildContext context,
    required PublisherModel publisher,
    required ValueChanged<PublisherUpdateModel> onSave,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PublisherEditDialog(
          publisher: publisher,
          onSave: onSave,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

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
                        Icons.edit_outlined,
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
                            l10n.publisherEditTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'ID #${publisher.id}',
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
                  child: PublisherEditForm(
                    publisher: publisher,
                    onSave: (updatedPublisher) {
                      onSave(updatedPublisher);
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
